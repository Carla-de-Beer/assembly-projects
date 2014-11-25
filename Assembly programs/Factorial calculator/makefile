fact: fact.o
	ld -o fact fact.o
	
fact.o: fact.asm
	yasm -f elf64 -g dwarf2 -l fact.1st fact.asm 