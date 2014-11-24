all: NewtonMethod.o newton.o
	gcc NewtonMethod.o newton.o -o NewtonMethod

NewtonMethod.o: NewtonMethod.c
	gcc -c NewtonMethod.c
	
newton.o: newton.asm
	yasm -f elf64 -g dwarf2 newton.asm -o newton.o

run: 
	./NewtonMethod

