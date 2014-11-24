; Carla de Beer
; Assembly language program that calculates the determinant 
; of a 2x2 or 3x3 matrix
; November 2014

segment .data
  msg 	db 	"Error", 0xa, 0
  store dq 	0
  fmt 	db 	"%d", 0xa, 0

segment .text
  global det
  extern printf

det
  push 	rbp
  mov 	rbp, rsp
  
  xor 	rcx, rcx 
  xor 	rax, rax
  
  cmp 	rsi, 4				; error message if 4 x 4 and larger
  jnl 	error_msg
  
  cmp 	rsi, 1				; 1 x 1 matrix
  jne 	two
  
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;; 	; print
    
	mov 	rax, [rdi]    
	xor 	rdi, rdi
	xor	rsi, rsi
      
	lea 	rdi, [fmt]
	mov 	rsi, rax

	xor 	rax, rax		; 0 floating point parameters    
	call 	printf
    
 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    
	mov 	eax, 1			; return 1 (determinant is computable)    
	jmp 	done

two:   
	  cmp 	rsi, 2			; 2 x 2 matrix
	  jne 	three
    
	  xor 	rbx, rbx
	  xor 	rax, rax
	  xor 	rcx, rcx
    
	  mov 	rbx, [rdi+8]
	  imul 	rbx, [rdi+4]
	  mov 	rax, [rdi]
	  imul 	rax, [rdi+12]
	  sub 	rax, rbx 		; determinant lives here

  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;; 	; print
    
	  xor 	rdi, rdi
	  xor 	rsi, rsi
    
	  lea 	rdi, [fmt]
	  mov 	rsi, rax
	  xor 	rax, rax		; 0 floating point parameters    
	  call 	printf
    
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    
	  mov 	eax, 1			; return 1 (determinant is computable)  
    
	  jmp 	done
    
  three:				; 3 x 3 matrix
	  cmp 	rsi, 3
	  jne 	done
    
	  xor 	rbx, rbx
	  xor 	rax, rax
	  xor 	rcx, rcx
    
	  mov 	rax, [rdi+0]
	  imul 	rax, [rdi+16]
	  imul 	rax, [rdi+32]
	  
	  mov 	rbx, [rdi+0]
	  imul 	rbx, [rdi+20]
	  imul 	rbx, [rdi+28]
	  
	  mov 	rcx, [rdi+4]
	  imul 	rcx, [rdi+12]
	  imul 	rcx, [rdi+32]
	  
	  mov 	rdx, [rdi+4]
	  imul 	rdx, [rdi+20]
	  imul 	rdx, [rdi+24]
	  
	  mov 	r14, [rdi+8]
	  imul 	r14, [rdi+12]
	  imul 	r14, [rdi+28]
	  
	  mov 	r15, [rdi+8]
	  imul 	r15, [rdi+16]
	  imul 	r15, [rdi+24]
    
	  sub 	rax, rbx
	  sub 	rax, rcx
	  add 	rax, rdx
	  add 	rax, r14
	  sub 	rax, r15 

    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;; 	; print
    
	  xor 	rdi, rdi
	  xor 	rsi, rsi    
	  lea 	rdi, [fmt]
	  mov 	rsi, rax
	  xor 	rax, rax		; 0 floating point parameters	  
	  call 	printf
    
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;  
    
	  xor 	rax, rax
	  mov 	eax, 1			; return 1 (determinant is computable)  
	  jmp 	done
  
  error_msg:
    
	  lea 	rdi, [msg]    
	  xor 	rax, rax	  
	  call 	printf
	  
	  xor 	rax, rax		; return 0 (determinant is not computable)  
	  jmp 	done
  
  done:      
	  leave
	  ret
