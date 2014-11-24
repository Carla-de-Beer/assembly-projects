; Carla de Beer
; Assembly function that employs the Newton Raphson method to approximate 
; the root of a polynomial function of the form ax^6 + bx^5 + cx^4 + dx^3 + ex^3 + fx^2 + gx + h
; November 2014

segment .data
  align 	8
  x		dq	0.0
  x1 		dq 	0.0
  tol 		dq	0.00000001	
  maxIter 	dq 	1000
  zero 		dq 	0.0
  one 		dq 	1.0
  two 		dq 	2.0
  three 	dq 	3.0
  four 		dq 	4.0
  five 		dq 	5.0
  six 		dq 	6.0
  pow2 		dq 	0.0
  pow3 		dq 	0.0
  pow4 		dq 	0.0
  pow5 		dq 	0.0
  pow6 		dq 	0.0
  negative 	dq 	-1.0
  msg 		dq 	"Error: no convergence.", 0xa, 0
  fmt		dq 	"%s", 0

segment .text
  global newton
  extern printf

newton:

  push 	rbp
  mov 	rbp, rsp
  
  cvtss2sd xmm0, xmm0		; convert floats to doubles
  cvtss2sd xmm1, xmm1
  cvtss2sd xmm2, xmm2
  cvtss2sd xmm3, xmm3
  cvtss2sd xmm4, xmm4
  cvtss2sd xmm5, xmm5
  cvtss2sd xmm6, xmm6
  
  movsd xmm7, [zero]		; err = xmm7
  movsd	xmm7, [tol]		
  addsd	xmm7, [one]		; err = tol + 1;    
  xor	rcx, rcx		; iter
  movsd xmm8, [x]		; x = xmm8	
  
  while:
  
    ucomisd xmm7, [tol]		; while(err > tol && iter < maxIter)
    jbe end_while
    cmp rcx, [maxIter]
    jnl end_while
    
    movsd xmm15, [zero]		; start with clean registers
    movsd xmm14, [zero]
    movsd xmm13, [zero]
    movsd xmm12, [zero]
    movsd xmm11, [zero]      
    movsd xmm10, [zero]     
    movsd xmm9,  [zero] 

    movsd xmm14, xmm8		; x
    
    movsd xmm13, xmm14
    mulsd xmm13, xmm14 		; x^2
    movsd [pow2], xmm13

    movsd xmm12, xmm13
    mulsd xmm12, xmm14 		; x^3
    movsd [pow3], xmm12

    movsd xmm11, xmm12
    mulsd xmm11, xmm14 		; x^4
    movsd [pow4], xmm11

    movsd xmm10, xmm11
    mulsd xmm10, xmm14 		; x^5
    movsd [pow5], xmm10     

    movsd xmm9, xmm10
    mulsd xmm9, xmm14 		; x^6
    movsd [pow6], xmm9

    movsd xmm15, xmm6		; g
    mulsd xmm14, xmm5		; f*x
    mulsd xmm13, xmm4		; e*x^2
    mulsd xmm12, xmm3		; d*x^3      
    mulsd xmm11, xmm2		; c*x^4
    mulsd xmm10, xmm1 		; b*x^5
    mulsd xmm9, xmm0		; a*x^6

    addsd xmm15, xmm14		; f*x + g
    addsd xmm15, xmm13  	; e*x^2 + f*x + g    
    addsd xmm15, xmm12		; d*x^3 + e*x^2 + f*x + g
    addsd xmm15, xmm11      	; c*x^4 + d*x^3 + e*x^2 + f*x + g
    addsd xmm15, xmm10   	; b*x^5 + c*x^4 + d*x^3 + e*x^2 + f*x + g 
    addsd xmm15, xmm9		; a*x^6 + b*x^5 + c*x^4 + d*x^3 + e*x^2 + f*x + g 		
				; xmm15 = top

    movsd xmm14, [zero]		; clear registers
    movsd xmm13, [zero]
    movsd xmm12, [zero]
    movsd xmm11, [zero]      
    movsd xmm10, [zero]     
    movsd xmm9,  [zero] 

    movsd xmm14, xmm8
    movsd xmm13, [pow2]
    movsd xmm12, [pow3]
    movsd xmm11, [pow4]
    movsd xmm10, [pow5]

    mulsd xmm10, xmm0		
    mulsd xmm10, [six]		; 6*a*x^5

    mulsd xmm11, xmm1
    mulsd xmm11, [five]		; 5*b*x^4

    mulsd xmm12, xmm2
    mulsd xmm12, [four]		; 4*c*x^3

    mulsd xmm13, xmm3
    mulsd xmm13, [three]	; 3*d*x^2

    mulsd xmm14, xmm4
    mulsd xmm14, [two]		; 2*e*x

    addsd xmm14, xmm5		; 2*e*x + f
    addsd xmm14, xmm13		; 3*d*x^2 + 2*e*x + f
    addsd xmm14, xmm12		; 4*c*x^3 + 3*d*x^2 + 2*e*x + f
    addsd xmm14, xmm11		; 5*b*x^4 + 4*c*x^3 + 3*d*x^2 + 2*e*x + f
    addsd xmm14, xmm10		; 6*a*x^5 + 5*b*x^4 + 4*c*x^3 + 3*d*x^2 + 2*e*x + f
				; xmm14 = bottom
    
    movsd xmm13, [zero]		; clear registers
    movsd xmm12, [zero]
    movsd xmm11, [zero]

    movsd xmm13, xmm15
    divsd xmm13, xmm14		; top/bottom
    movsd xmm12, xmm8
    subsd xmm12, xmm13		; x1 = x - (top/bottom)

    movsd xmm7, xmm13		; err = x1
    subsd xmm7, xmm8		; err = x1 - x

    ucomisd xmm7, [zero]	; err = fabs(x1 - x)
    jae .fabs_check
    mulsd xmm7, [negative]
    jmp .fabs_check

    .fabs_check:
    movsd xmm8, xmm12		; x = x1
    inc rcx			; ++iter
	  
  jmp while
  
  end_while:
  
  ucomisd xmm7, [tol]
  ja .error
      lea 	rdi, [fmt]
      lea	rsi, [msg]    
      xor 	rax, rax    
      call 	printf    
      jmp .done
      
  .error:
      movsd 	xmm0, [zero]
      movsd 	xmm0, xmm8	; xmm0 = x

      jmp .done
      
  .done:  
    xor rax, rax
    pop rbp
    ret
