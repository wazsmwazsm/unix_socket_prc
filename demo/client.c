#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <unistd.h>
#include <arpa/inet.h>
#include <sys/socket.h>

int main() {
    // 创建 socket
    int sock = socket(AF_INET, SOCK_STREAM, 0);
    if (sock == -1) {
        printf("socket create err\n");
        exit(0);
    }

    // 向 server 发数据
    struct sockaddr_in serv_addr;
    serv_addr.sin_family = AF_INET;
    serv_addr.sin_addr.s_addr = inet_addr("127.0.0.1");
    serv_addr.sin_port = htons(8808);
    bzero(&(serv_addr.sin_zero), 8); 

    // 连接服务端
    if(connect(sock, (struct sockaddr*)&serv_addr, sizeof(serv_addr)) == -1) {
        printf("connect err\n");
        exit(0);
    }

    // 读取响应
    char buffer[40];
    read(sock, buffer, sizeof(buffer));

    printf("Message form server: %s\n", buffer);

    // 关闭 socket
    close(sock);

    return 0;
}
