;=================================================
; Name: Anthony Mejia
; Email: ameji012@ucr.edu
; 
; Assignment name: Assignment 3
; Lab section: 022
; 
; I hereby certify that I have not received assistance on this assignment,
; or used code, from ANY outside source other than the instruction team.
;
;=================================================

.ORIG x3000			; Program begins here
;-------------
;Instructions
;-------------
LD R6, Convert_addr		; R6 <-- Address pointer for Convert
LDR R1, R6, #0			; R1 <-- VARIABLE Convert 
LD R3, MASK
;-------------------------------
;INSERT CODE STARTING FROM HERE
;--------------------------------
LD R4, COUNTER
LD R5, COUNTER_2
ADD R2, R1, #0

LOOP
	AND R0, R2, R3

	BRz PRINT_0
	BRn PRINT_1
PRINT_1
	LD R0, ONE
	OUT
	BRnzp NEXT
PRINT_0
	LD R0, ZERO
	OUT
	BRnzp NEXT

NEXT
	ADD R2, R2, R2
	ADD R4, R4, #-1
	BRp LOOP
	ADD R5, R5, #0
	BRz DONE

	LD R4, COUNTER
	LD R0, SPACE
	OUT
	ADD R5, R5, #-1
	BRzp LOOP
DONE

LD R0, NEWLINE
OUT

HALT
;---------------	
;Data
;---------------
Convert_addr .FILL xD000	; The address of where to find the data
MASK .FILL x8000
COUNTER .FILL #4
COUNTER_2 .FILL #3
SPACE .FILL x20
ZERO .FILL x30
ONE .FILL x31
NEWLINE .FILL x0A


.ORIG xD000			; Remote data
Convert .FILL xABCD		; <----!!!NUMBER TO BE CONVERTED TO BINARY!!!
;---------------	
;END of PROGRAM
;---------------	
.END
