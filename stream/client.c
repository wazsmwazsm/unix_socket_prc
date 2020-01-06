#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <unistd.h>
#include <arpa/inet.h>
#include <sys/socket.h>

#define BUF_SIZE 100

int main() {
    int sock = socket(AF_INET, SOCK_STREAM, 0);
    if (sock < 0) {
        printf("socket create err\n");
        return 0;
    }

    struct sockaddr_in serv_addr;
    serv_addr.sin_family = AF_INET;
    serv_addr.sin_addr.s_addr = inet_addr("127.0.0.1");
    serv_addr.sin_port = htons(8808);
    bzero(&(serv_addr.sin_zero), 8); 

    if(connect(sock, (struct sockaddr*)&serv_addr, sizeof(serv_addr)) < 0) {
        printf("connect err\n");
        return 0;
    }

    char * writeBuf = "hello";
    for (int i = 0; i < 3; i++)
    {
        if(write(sock, writeBuf, strlen(writeBuf)) < 0) {
            printf("write err\n");
            return 0;
        }
    }

    char readBuf[BUF_SIZE];
    if(read(sock, &readBuf, BUF_SIZE) < 0) {
        printf("read err\n");
        return 0;
    }

    printf("Message form server: %s\n", readBuf);

    close(sock);

    return 0;
}
