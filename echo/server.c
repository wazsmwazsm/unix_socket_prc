#include <stdio.h>
#include <string.h>
#include <sys/socket.h>
#include <arpa/inet.h>
#include <netinet/in.h>
#include <stdlib.h>
#include <unistd.h>

#define BUF_SIZE 100

int main() {

    int serv_sock = socket(AF_INET, SOCK_STREAM, IPPROTO_TCP);
    if (serv_sock == -1) {
        printf("socket create err\n");
        return 0;
    }

    struct sockaddr_in serv_addr;
    serv_addr.sin_family = AF_INET;
    serv_addr.sin_addr.s_addr = inet_addr("127.0.0.1");
    serv_addr.sin_port = htons(8808);
    bzero(&(serv_addr.sin_zero), 8); 

    if (bind(serv_sock, (struct sockaddr*)&serv_addr, sizeof(serv_addr)) == -1) {
        printf("bind err\n");
        return 0;
    }
    
    if(listen(serv_sock, 20) == -1) {
        printf("listen err\n");
        return 0;
    }

    struct sockaddr_in clnt_addr;
    socklen_t clnt_addr_size = sizeof(clnt_addr);
    int clnt_sock = accept(serv_sock, (struct sockaddr*)&clnt_addr, &clnt_addr_size);
    if (clnt_sock == -1) {
        printf("conn accept err\n");
        return 0;
    }
    printf("conn accepted ip: %s port: %d\n", inet_ntoa(*((struct in_addr*)&clnt_addr.sin_addr.s_addr)), clnt_addr.sin_port);
    // 读取客户端数据
    char buffer[BUF_SIZE] = {0}; 
    if(read(clnt_sock, &buffer, BUF_SIZE) == -1) {
        printf("read err\n");
        return 0;
    }
    printf("request content: %s", buffer);
    // 回写
    if(write(clnt_sock, buffer, BUF_SIZE) == -1) {
        printf("write err\n");
        return 0;
    }

    close(clnt_sock);
    close(serv_sock);

    return 0;
}   
