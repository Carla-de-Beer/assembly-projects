all: sort.o bsort.o
	gcc sort.o bsort.o -o sort -m64

sort.o: sort.c
	gcc -c sort.c -m64
	
bsort.o: bsort.asm
	yasm -f elf64 -g dwarf2 bsort.asm -o bsort.o

run: 
	./sort

