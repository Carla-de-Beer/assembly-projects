all: primeCalculator.o prime.o
	gcc primeCalculator.o prime.o -o primeCalculator

primeCalculator.o: primeCalculator.c
	gcc -c primeCalculator.c
	
prime.o: prime.asm
	yasm -f elf64 -g dwarf2 prime.asm -o prime.o

run: 
	./primeCalculator

