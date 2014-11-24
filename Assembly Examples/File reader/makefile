all: fileReader.o reader.o
	gcc fileReader.o reader.o -o fileReader -static

fileReader.o: fileReader.c
	gcc -c fileReader.c
	
reader.o: reader.asm
	yasm -f elf64 -g dwarf2 reader.asm -o reader.o

run: 
	./fileReader

