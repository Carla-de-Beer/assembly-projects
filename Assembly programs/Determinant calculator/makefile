all: determinantCalc.o det.o
	gcc determinantCalc.o det.o -o determinantCalc -m64

determinantCalc.o: determinantCalc.c
	gcc -c determinantCalc.c -m64
	
det.o: det.asm
	yasm -f elf64 -g dwarf2 det.asm -o det.o

run: 
	./determinantCalc

