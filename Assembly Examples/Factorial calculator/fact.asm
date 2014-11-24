; Carla de Beer
; Assembly program that calculates factorials for single digit inputs 
; November 2014

section	.data	
  nl db "",2,0
  nlf db "",10,0
  input dq '',3,0  
  lf db 10
  
section .bss
  decimal resb 32

section	.text
  global _start      

_start:   		
    
 ; reading input value 
  mov rax, 0			; system read
  mov rdi, 0			; STD IN
  mov rsi, input		; address first byte in output
  mov rdx, 1			; load length into rdx
  syscall
  
  ; reading newline
  mov rax, 0			; system read
  mov rdi, 0			; STD IN
  mov rsi, nl			; address first byte in output
  mov rdx, 1			; load length into rdx
  syscall

  xor rbx, rbx
  mov rbx,  [input]     	; for calculating factorial 
  sub rbx, '0'	
  call  calc_fact
  
  ; ///// De_ASCII-fy
  
  mov rdi, decimal
  mov rsi, rax
  call IntegerToDecimal

  mov   eax, 1       	 	; sys_write
  mov   edi, 1       	 	; STDOUT
  mov   rsi, decimal  		; String address
  mov   edx, 32       		; Max. string length
  syscall

  mov   eax, 1       		; sys_write
  mov   edi, 1        		; STDOUT
  mov   rsi, lf       		; Line Feed address
  mov   edx, 1        		; Max. string length
  syscall

  mov eax, 60        		; sys_exit
  xor edi, edi        		; return 0 (success)
  syscall
  
  ; //////

  mov rax, 1			; system write
  mov rdi, 1			; STD OUT
  mov rsi, nlf			; address first byte in output
  mov rdx, 1			; load length in rdx
  syscall 
  
  ; exit
  xor rdi, rdi
  push 0x3c
  pop rax
  syscall
  
  calc_fact:
     cmp   rbx, 1
     jg    do_calculation
     mov   rax, 1
     ret
      
  do_calculation:
     dec   rbx
     call  calc_fact
     inc   rbx
     mul   rbx         		; ax = al * bl
     ret

  IntegerToDecimal:
    mov rax, rsi
    mov ebx, 10         	; divisor
    xor ecx, ecx        
  .Loop_1:
    xor edx, edx
    div rbx             	; rbx = rax Remainder rdx
    push dx             	; LIFO
    add cl, 1
    or  rax, rax        
    jnz .Loop_1         
  .Loop_2:
    pop ax              	; Get back pushed digits
    or al, 00110000b    	; Convert to ASCII
    mov [rdi], al       	; Store character
    add rdi, 1          	; Increment target address
    loop .Loop_2        	; ... until there are no digits left
    mov byte [rdi], 0   	; ASCII-null-terminator
    ret   
 