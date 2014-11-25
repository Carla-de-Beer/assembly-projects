all: newtonMethod.o newton.o
	gcc newtonMethod.o newton.o -o newtonMethod

newtonMethod.o: newtonMethod.c
	gcc -c newtonMethod.c
	
newton.o: newton.asm
	yasm -f elf64 -g dwarf2 newton.asm -o newton.o

run: 
	./newtonMethod

