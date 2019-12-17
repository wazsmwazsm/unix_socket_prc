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
    bzero(&(serv_addr.sin_zero), 8); // sin_zero 初始化为 0 (和 go 不一样, c 里需要手动填充 0)

    // addrlen 指定了以 addr 所指向的地址结构体的字节长度
    if (bind(serv_sock, (struct sockaddr*)&serv_addr, sizeof(serv_addr)) == -1) {
        printf("bind err\n");
        exit(0);
    }
    // 进入监听状态，等待用户发起请求
    // Kernel 会为 LISTEN 状态的 socket 维护一个队列，其中存放SYN RECEIVED和 ESTABLISHED 状态的套接字，backlog 参数就是这个队列的大小
    if(listen(serv_sock, 20) == -1) {
        printf("listen err\n");
        exit(0);
    }

    // 接收客户端请求
    struct sockaddr_in clnt_addr;
    socklen_t clnt_addr_size = sizeof(clnt_addr);
    int clnt_sock = accept(serv_sock, (struct sockaddr*)&clnt_addr, &clnt_addr_size);
    if (clnt_sock == -1) {
        printf("conn accept err\n");
        exit(0);
    }

    // c 里面只有结构体指针能强转, 结构体不能强转
    printf("conn accepted ip: %s port: %d\n", inet_ntoa(*((struct in_addr*)&clnt_addr.sin_addr.s_addr)), clnt_addr.sin_port);

    // 向客户端发送数据
    char str[] = "hello, my name is little server!\n";
    write(clnt_sock, str, sizeof(str));

    // 关闭 socket
    close(clnt_sock);
    close(serv_sock);

    return 0;
}   
