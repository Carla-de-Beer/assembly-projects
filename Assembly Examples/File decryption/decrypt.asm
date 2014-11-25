; Carla de Beer

; Assembly function that decrypts a given text file by doing the following:
; - selecting one byte at a time;
; - rotating the byte right by one bit
; - decrementing the byte
; - repeating the process ubntil EOF is reached

; Date created: 31/10/2014

segment .data
  align   	8
  infd    	dq      0
  in_name 	dq      0
  in_size 	dq      0
  data    	dq      0
  msg 		db 	"Error! File not found.", 0xa, 0
  fmt		db	"%s", 0
  store		db	0
   
segment .text
  global decrypt
  extern  open, malloc, lseek, read, write, close, printf

decrypt:

  push rbp
  mov rbp, rsp
  
  ; Save the input and output file names
  mov   [in_name], rdi
  
  ; Try to open the input file
  mov   rdi, [in_name]
  xor   esi, esi
  call  open
  cmp	rax, 0
  jl .error  
  mov 	[infd], rax  
  
  ; Determine the input file size
  mov	rdi, [infd]
  xor   esi, esi
  mov   edx, 2
  call  lseek
  mov   [in_size], rax
  mov   rdi, [infd]
  xor   esi, esi
  mov   edx, 0
  call  lseek
  
  ; Allocate the data array
  mov   rdi, [in_size]
  call  malloc
  mov 	[data], rax
  
  ; Seek to start of input file 
  mov 	edi, [infd]
  xor 	esi, esi
  xor 	edx, edx
  call 	lseek
  
  ; Read the input file
  mov	rdi, [infd]
  mov   rsi, [data]
  mov   rdx, [in_size]
  call  read
  mov [infd], rax  
    
  ; //////////////////////
  
  xor 	rcx,rcx
  mov 	r15, [in_size]
  mov 	r14, [data]
  	
  .decryption:
	cmp 	r15, rcx
	je .end
	
	dec 	byte[r14+rcx]
	ror 	byte[r14+rcx], 1
	inc 	rcx
	cmp 	r15, rcx
	jne .decryption
	
  .printLoop:
	mov 	[store], r14
	mov 	edi, [store]
	call 	printf
  .end:

  ; //////////////////////

  ; Close the input and output files
  mov   rdi, [infd]
  call  close

  xor   eax, eax
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