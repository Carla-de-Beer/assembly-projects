; Carla de Beer

; Assembly function that inputs the area of a triangle based 
; on the input of a a set of three 2D coordinates passed via the C function

; Date created: 09/10/2014

segment .data
  half 		dd 	0.5  
  zero 		dd 	0.00
  negative 	dd 	-1.0

segment .text
  global area

area:

  push 	rbp
  mov 	rbp, rsp
  
  movss xmm7, xmm0
  subss xmm7, xmm2
  
  movss xmm8, xmm1
  subss xmm8, xmm3
  
  movss xmm9, xmm2
  subss xmm9, xmm4
  
  movss xmm10, xmm3
  subss xmm10, xmm5
  
  mulss xmm7, xmm10
  mulss xmm8, xmm9
  subss xmm7, xmm8
  
  ucomiss xmm7, [zero]
  jae get_result
    mulss xmm7, [negative]
  
  get_result:
 
  mulss xmm7, [half] 
  movss xmm0, [zero]
  movss xmm0, xmm7
  
  leave
  ret
