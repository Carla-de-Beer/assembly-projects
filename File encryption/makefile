all: fileEncryption.o encrypt.o
	gcc fileEncryption.o encrypt.o -o fileEncryption -static

fileEncryption.o: fileEncryption.c
	gcc -c fileEncryption.c
	
encrypt.o: encrypt.asm
	yasm -f elf64 -g dwarf2 encrypt.asm -o encrypt.o

run: 
	./fileEncryption

