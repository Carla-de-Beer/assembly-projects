; Carla de Beer
; Assembly language function, called via C, that implements a bubble sort algorithm
; Date created: 09/10/2014

segment .data

segment .text
global bsort
  extern printf
  extern stdout

bsort:

  push 	rbp
  mov 	rbp, rsp
  
  xor 	rax, rax
  xor 	r15, r15
  xor 	r14, r14
  xor 	r9, r9
  xor 	r8, r8

  dec 	rsi					; rsi = size-1
    
  for1:						; for (i = (size - 1); i > 0; i--)
	  cmp 	r8, rsi		
	  jnl 	end_for1
    
	  mov 	rax, rsi
	  imul 	rax, 4
	  add 	rax, rdi
    
	  xor 	r9, r9
	  xor 	r9, rsi
    
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    
  for2:						; for (j = 1; j <= i; j++)
	  cmp 	r9, r8
	  jng 	end_for2
    
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    
	  mov 	r14d, [rax]
	  mov 	r15d, [rax-4] 			; = temp
    
	  cmp 	r14d, r15d			; if (numbers[j-1] > numbers[j])
	  jnl 	done_if
    
	  mov 	[rax-4], r14d			; swap
	  mov 	[rax], r15d			; swap
    
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    
  done_if:
	  dec 	r9				; --i
	  sub 	rax, 4
	  jmp 	for2
    
  end_for2:
	  inc 	r8				; ++j
	  jmp 	for1

  end_for1:
	  xor 	rax, rax
	  leave
	  ret
