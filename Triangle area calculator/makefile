all: areaCalc.o area.o
	gcc areaCalc.o area.o -o areaCalc

areaCalc.o: areaCalc.c
	gcc -c areaCalc.c
	
area.o: area.asm
	yasm -f elf64 -g dwarf2 area.asm -o area.o

run: 
	./areaCalc

