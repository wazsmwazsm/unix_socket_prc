all: build

TARGET = server client *.i *.o *.s
build:
	make server client
server:
	gcc -E server.c -o server.i
	gcc -S server.i -o server.s
	gcc -c server.s -o server.o
	gcc server.o -o server
client:
	gcc -E client.c -o client.i
	gcc -S client.i -o client.s
	gcc -c client.s -o client.o
	gcc client.o -o client
clean:
	rm -rf $(TARGET)
 