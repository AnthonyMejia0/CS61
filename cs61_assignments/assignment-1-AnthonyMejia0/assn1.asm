;=================================================
; Name: Anthony Mejia
; Email: ameji012@ucr.edu
; 
; Assignment name: Assignment 1
; Lab section: 022
; 
; I hereby certify that I have not received assistance on this assignment,
; or used code, from ANY outside source other than the instruction team.
;
;=================================================

;-------------------------------
;PUT TABLE HERE
;--------------------------------

;-------------------------------------------------------------------------
;REG VALUES	R0	R1	R2	R3	R4	R5	R6	R7
;-------------------------------------------------------------------------
;Pre-loop	x	0	12	6	x	x	x	x
;iteration 01	x	12	12	5	x	x	x	x
;iteration 02	x	24	12	4	x	x	x	x
;iteration 03	x	36	12	3	x	x	x	x
;iteration 04	x	48	12	2	x	x	x	x
;iteration 05	x	60	12	1	x	x	x	x
;iteration 06	x	72	12	0	x	x	x	x
;End of Program	x	72	12	0	x	x	x	x
;-------------------------------------------------------------------------

.ORIG x3000			; Program begins here
;-------------
;Instructions
;-------------
;-------------------------------
;INSERT CODE STARTING FROM HERE
;-------------------------------
	LD R1, DEC_0
	LD R2, DEC_12
	LD R3, DEC_6

	DO_WHILE
		ADD R1, R1, R2
		ADD R3, R3, #-1
		BRp DO_WHILE 

HALT
;---------------	
;Data
;---------------
	DEC_0	.FILL	#0
	DEC_12	.FILL	#12
	DEC_6	.FILL	#6

;---------------	
;END of PROGRAM
;---------------	
.END


