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
    if (serv_sock < 0) {
        printf("socket create err\n");
        return 0;
    }

    int on = 1;
    if(setsockopt(serv_sock, SOL_SOCKET, SO_REUSEADDR, &on, sizeof(on)) < 0) {
        printf("set socket reuse addr err\n");
        return 0;
    }
    
    struct sockaddr_in serv_addr;
    serv_addr.sin_family = AF_INET;
    serv_addr.sin_addr.s_addr = inet_addr("127.0.0.1");
    serv_addr.sin_port = htons(8808);
    bzero(&(serv_addr.sin_zero), 8); 

    if (bind(serv_sock, (struct sockaddr*)&serv_addr, sizeof(serv_addr)) < 0) {
        printf("bind err\n");
        return 0;
    }
    
    if(listen(serv_sock, 20) < 0) {
        printf("listen err\n");
        return 0;
    }

    struct sockaddr_in clnt_addr;
    socklen_t clnt_addr_size = sizeof(clnt_addr);
    char buffer[BUF_SIZE] = {0}; 

    while(1) { // 持续接受请求
        int clnt_sock = accept(serv_sock, (struct sockaddr*)&clnt_addr, &clnt_addr_size);
        if (clnt_sock < 0) {
            printf("conn accept err\n");
        }
        printf("conn accepted ip: %s port: %d\n", inet_ntoa(*((struct in_addr*)&clnt_addr.sin_addr.s_addr)), clnt_addr.sin_port);

        
        while (strcmp(buffer, "quit\n") != 0) {
            if(read(clnt_sock, &buffer, BUF_SIZE) < 0) {
                printf("read err\n");
            }
            printf("request content: %s", buffer);
            if(write(clnt_sock, buffer, BUF_SIZE) < 0) {
                printf("write err\n");
            }
        }
        
        // shutdown 可单项关闭连接, 关闭 socket 的 tcp 连接（即使共享 socket）
        // SHUT_RD: 断开输入流。套接字无法接收数据（即使输入缓冲区收到数据也被抹去），无法调用输入相关函数。
        // SHUT_WR: 断开输出流。套接字无法发送数据，但如果输出缓冲区中还有未传输的数据，则将传递到目标主机。
        // SHUT_RDWR: 同时断开 I/O 流。相当于分两次调用 shutdown()，其中一次以 SHUT_RD 为参数，另一次以 SHUT_WR 为参数。
        shutdown(clnt_sock, SHUT_RD);
        printf("client conn shutdown\n");

        memset(buffer, 0, BUF_SIZE);
    }

    
    close(serv_sock);

    return 0;
}   
