; Carla de Beer
; Assembly function, called via C, that calculates whether a number is prime or not
; Date created: 29/09/2014

segment .data

isPrime 	db "%d is prime!", 0xa, 0
notIsPrime 	db "%d is not prime!", 0xa, 0

segment .text
global prime
  extern printf

prime:
  push	rbp
  mov	rbp, rsp
  
  mov 	r15, rdi
  cmp	r15, 0		; if equal to 0
  je 	return_false
  
  cmp 	r15, 1		; if equal to 1
  je 	return_false
  
  xor 	rax, rax
  xor 	rdx, rdx
  
  mov 	rax, r15
  mov 	r14, 2
  
while:
  cmp 	r14, r15
  jnl 	end_while
  
  idiv 	r14
  cmp 	rdx, 0		; number is a factor
  je 	return_false
  xor 	rax, rax
  xor 	rdx, rdx
  mov 	rax, r15
  
  inc 	r14  
  jmp 	while
  
  return_false:
	  xor	rax, rax
	  xor 	rdi, rdi
	  xor 	rsi, rsi    
	  lea 	rdi, [notIsPrime]
	  mov 	rsi, r15
	  
	  xor 	eax, eax    
	  call 	printf      
	  xor 	eax, eax
    
	  leave
	  ret
  
end_while:
	xor 	rax, rax
	xor 	rdi, rdi
	xor 	rsi, rsi  
	lea 	rdi, [isPrime]
	mov 	rsi, r15
  
	xor eax, eax  
	call printf  
	xor eax, eax
  
	leave
	ret
