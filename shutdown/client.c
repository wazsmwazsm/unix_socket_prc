#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <unistd.h>
#include <arpa/inet.h>
#include <sys/socket.h>
#include <error.h>
#include <errno.h>

#define BUF_SIZE 100

int main() {
    

    struct sockaddr_in serv_addr;
    serv_addr.sin_family = AF_INET;
    serv_addr.sin_addr.s_addr = inet_addr("127.0.0.1");
    serv_addr.sin_port = htons(8808);
    bzero(&(serv_addr.sin_zero), 8); 

    char writeBuf[BUF_SIZE] = {0};
    char readBuf[BUF_SIZE];

    int sock = socket(AF_INET, SOCK_STREAM, 0);
    if (sock < 0) {
        printf("socket create err\n");
        return 0;
    }

    if(connect(sock, (struct sockaddr*)&serv_addr, sizeof(serv_addr)) < 0) {
        printf("connect err\n");
        return 0;
    }

    struct timeval tv; 
    tv.tv_sec = 5; // 5s 超时
    tv.tv_usec = 0;
    
    setsockopt(sock, SOL_SOCKET, SO_RCVTIMEO, &tv, sizeof(tv));


    while(1) {
        
        printf("Input a string: ");
        fgets(writeBuf, BUF_SIZE, stdin);
        if(write(sock, writeBuf, strlen(writeBuf)) < 0) {
            printf("write err\n");
            return 0; 
        }

        if(read(sock, &readBuf, BUF_SIZE) < 0) {
            if (errno == EWOULDBLOCK)
            {
                printf("socket timeout.\n");
            } else {
                printf("read err\n");
            }
            
            return 0;
        }

        printf("Message form server: %s\n", readBuf);

        memset(writeBuf, 0, BUF_SIZE);
        memset(readBuf, 0, BUF_SIZE);
        
    }
    close(sock);

    return 0;
}
