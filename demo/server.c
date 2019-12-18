#include <stdio.h>
#include <string.h>
#include <sys/socket.h>
#include <arpa/inet.h>
#include <netinet/in.h>
#include <stdlib.h>
#include <unistd.h>

int main() {
    // 创建 socket 
    // AF_INET: ipv4
    // SOCK_STREAM: 面向连接的套接字
    // IPPROTO_TCP: 使用 TCP 协议
    int serv_sock = socket(AF_INET, SOCK_STREAM, IPPROTO_TCP);
    if (serv_sock == -1) {
        printf("socket create err\n");
        exit(0);
    }
    // 绑定 ip port
    struct sockaddr_in serv_addr;
    serv_addr.sin_family = AF_INET;
    serv_addr.sin_addr.s_addr = inet_addr("127.0.0.1");
    serv_addr.sin_port = htons(8808);
    // sin_zero 是为了让 sockaddr 与 sockaddr_in 两个数据结构保持大小相同而保留的空字节
    // 用来将 sockaddr_in 结构填充到与struct sockaddr 同样的长度
    // sockaddr_in6 则完全用了后 14 个字节的空间, 不用填 0
    bzero(&(serv_addr.sin_zero), 8); // ipv4 用不到后面sin_zero 初始化为 0

    // sockaddr 是 bind connect 等函数需要的通用结构, 后面 14 个字节保存 127.0.0.1:80
    // 但是没有相关函数将这个字符串转换成需要的形式，所以一般需要设置 sockaddr_in sockaddr_in6
    // 再进行地址强转
    // addrlen 指定了以 addr 所指向的地址结构体的字节长度
    if (bind(serv_sock, (struct sockaddr*)&serv_addr, sizeof(serv_addr)) == -1) {
        printf("bind err\n");
        exit(0);
    }
    // 进入监听状态，等待用户发起请求
    // backlog 为请求队列的最大长度，根据并发量设置，设置为 SOMAXCONN 的话就由系统来决定请求队列长度
    // 当套接字正在处理客户端请求时，如果有新的请求进来，
    // 套接字是没法处理的，只能把它放进缓冲区，待当前请求处理完毕后，
    // 再从缓冲区中读取出来处理。如果不断有新的请求进来，
    // 它们就按照先后顺序在缓冲区中排队，直到缓冲区满。
    // 这个缓冲区，就称为请求队列（Request Queue）
    if(listen(serv_sock, 20) == -1) {
        printf("listen err\n");
        exit(0);
    }

    // 接收客户端请求
    struct sockaddr_in clnt_addr;
    socklen_t clnt_addr_size = sizeof(clnt_addr);
    // accept 返回一个新的 socket 来和客户端通信
    int clnt_sock = accept(serv_sock, (struct sockaddr*)&clnt_addr, &clnt_addr_size);
    if (clnt_sock == -1) {
        printf("conn accept err\n");
        exit(0);
    }

    // c 里面结构体指针强转（指针指向新结构体的内存开始地址，结构体长度相同的话，不会丢失、多余字节）
    printf("conn accepted ip: %s port: %d\n", inet_ntoa(*((struct in_addr*)&clnt_addr.sin_addr.s_addr)), clnt_addr.sin_port);

    // 向客户端发送数据
    char str[] = "hello, my name is little server!\n";
    // buf 为要写入的数据的缓冲区地址，nbytes 为要写入的数据的字节数
    // send 函数可以进行更详细的参数设置
    if(write(clnt_sock, str, sizeof(str)) == -1) {
        printf("write err\n");
        exit(0);
    }

    // 关闭 socket
    close(clnt_sock);
    close(serv_sock);

    return 0;
}   
