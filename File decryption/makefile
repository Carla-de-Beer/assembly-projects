all: fileDecryption.o decrypt.o
	gcc fileDecryption.o decrypt.o -o fileDecryption -static

fileDecryption.o: fileDecryption.c
	gcc -c fileDecryption.c
	
decrypt.o: decrypt.asm
	yasm -f elf64 -g dwarf2 decrypt.asm -o decrypt.o

run: 
	./fileDecryption

