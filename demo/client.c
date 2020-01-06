#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <unistd.h>
#include <arpa/inet.h>
#include <sys/socket.h>

int main() {
    // 创建 socket
    int sock = socket(AF_INET, SOCK_STREAM, 0);
    if (sock < 0) {
        printf("socket create err\n");
        return 0;
    }

    // 获取 socket 缓冲区
    unsigned optSndVal, optRcvVal;
    socklen_t optLen = sizeof(int);
    getsockopt(sock, SOL_SOCKET, SO_SNDBUF, (char*)&optSndVal, &optLen);
    getsockopt(sock, SOL_SOCKET, SO_RCVBUF, (char*)&optRcvVal, &optLen);
    printf("Send Buffer length: %d, Recv buffer length:%d\n", optSndVal, optRcvVal);

    // 设置缓冲区大小
    unsigned newOptSndVal = 1024;
    setsockopt(sock, SOL_SOCKET, SO_RCVBUF, (char*)&newOptSndVal, optLen);
    // 重获取
    getsockopt(sock, SOL_SOCKET, SO_RCVBUF, (char*)&optSndVal, &optLen);
    printf("Send Buffer length: %d, Recv buffer length:%d\n", optSndVal, optRcvVal);
  
  
    // 向 server 发数据
    struct sockaddr_in serv_addr;
    serv_addr.sin_family = AF_INET;
    serv_addr.sin_addr.s_addr = inet_addr("127.0.0.1");
    serv_addr.sin_port = htons(8808);
    bzero(&(serv_addr.sin_zero), 8); 

    // 连接服务端
    if(connect(sock, (struct sockaddr*)&serv_addr, sizeof(serv_addr)) < 0) {
        printf("connect err\n");
        return 0;
    }

    // 读取响应
    char buffer[40];
    // buf 为要接收数据的缓冲区地址，nbytes 为要读取的数据的字节数
    // recv 函数可以进行更详细的参数设置
    if(read(sock, buffer, sizeof(buffer)) < 0) {
        printf("read err\n");
        return 0;
    }

    printf("Message form server: %s\n", buffer);

    // 关闭 socket 
    close(sock); // TCP连接是全双工的，因此每个方向都必须单独进行关闭

    return 0;
}
