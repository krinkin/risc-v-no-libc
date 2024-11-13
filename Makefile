all:
	as   -g main.s    -o hello.o
	ld -T rv64.ld -g hello.o   -o hello

clean:
	rm ./hello
	rm ./*.o


