; Carla de Beer

; Assembly function, called via C, that reads and displays 
; the data contained in a .txt input file

; Date created: 31/10/2014

segment .data
  align   	8
  fd 		dq 0
  file_size 	dq 0
  data 		dq 0
  fileName 	dd 0
  name 		dq 0
  msg 		db "Error! File not found.", 0xa, 0
  fmt		db "%s", 0
  char 		times 128 dq 0

  
segment .text
  global reader
  extern  open, malloc, lseek, read, write, close, printf, scanf

reader:

  push rbp
  mov rbp, rsp
  
  ; Scan the file name
  xor 	rdi, rdi
  xor 	rsi, rsi
  lea 	rdi, [fmt]
  lea   rsi, [char]
  xor	rax, rax
  call	scanf
  
  ; Try to open the file  
  lea 	rdi, [char]
  xor 	esi,esi
  call 	open
  cmp 	rax, 0
  jl 	.error  
  mov 	[fd], rax  
  
  ; Determine the file size
  mov 	rdi, [fd]
  xor 	esi, esi
  mov 	edx, 2
  call 	lseek
  mov  	[file_size], rax
  mov  	rdi, [fd]
  xor  	esi, esi
  mov  	edx, 0
  call 	lseek

  ; Allocate the data array
  mov  	rdi, [file_size]
  call 	malloc
  cmp   rax, 0
  
  ; seek to start of file 
  mov 	[data], rax
  mov 	edi, [fd]
  xor 	esi, esi
  xor 	edx, edx
  call 	lseek
  
  ; read the file  
  mov  rdi, [fd]
  mov  rsi, [data]
  mov  rdx, [file_size]
  call read
  
  xor 	rdi, rdi
  lea 	rdi, [fmt]
    
  ; print file contents
  xor 	rax, rax    
  call 	printf    
  xor 	rax, rax
  
  ; close file  
  mov 	rdi, [fd]
  call 	close  
  xor 	eax, eax
  leave
  ret
  
  ; If file can't be opened...  
  .error:
	lea 	rdi, [fmt]
	lea	rsi, [msg]    
	xor 	rax, rax    
	call 	printf    
	mov 	eax, 1
	leave 
	ret
