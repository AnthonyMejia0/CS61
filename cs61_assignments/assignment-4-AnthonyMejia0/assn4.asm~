;=================================================
; Name: Anthony Mejia
; Email: ameji012@ucr.edu
; 
; Assignment name: Assignment 4
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

;-------------------------------
;INSERT CODE STARTING FROM HERE 
;--------------------------------
JSR SUB_GET_NUM_3200
LD R0, NEWLINE
OUT

HALT
;---------------	
;Data
;---------------

;------------
;Remote data
;------------
NEWLINE .FILL x0A

.ORIG x6000
;---------------
;messages
;---------------
intro .STRINGZ	"Input a positive or negative decimal number (max 5 digits), followed by ENTER\n"
;---------------
;error_messages
;---------------
.ORIG x6100	
error_mes .STRINGZ	"\nERROR INVALID INPUT\n"

;---------------------------------------------------------------
;Subroutine: SUB_GET_NUM_3200
;Parameter (R5): Register that will hold final value
;Postcondition: The subroutine has converted textual number into
;	decimal number and stored the value in R5
;Return Value: R5
;---------------------------------------------------------------
.ORIG x3200

SUB_GET_NUM_3200
	ST R0, BACKUP_R0_3200
	ST R1, BACKUP_R1_3200
	ST R2, BACKUP_R2_3200
	ST R3, BACKUP_R3_3200
	ST R4, BACKUP_R4_3200
	ST R6, BACKUP_R6_3200
	ST R7, BACKUP_R7_3200
	
	LD R2, COUNTER
	LD R3, TO_NUM
	BRnzp GO

SET_FLAG
	OUT
	ADD R6, R6, #-1
	BRnzp NEXT
PRINT_PLUS
	OUT
	BRnzp NEXT
CHECK_RANGE
	LD R1, ZERO
	ADD R1, R0, R1
	BRn ERROR
	LD R1, NINE
	ADD R1, R0, R1
	BRp ERROR
	BRnzp VALID_RANGE
ERROR
	LD R0, errorMessage
	PUTS
	BRnzp GO
GO
	LD R0, introMessage
	PUTS
	LD R2, COUNTER
	AND R5, R5, #0
	LD R6, NEGATIVE
	
	GETC
	LD R4, MINUS
	NOT R4, R4
	ADD R4, R4, #1
	ADD R1, R0, R4
	BRz SET_FLAG
	LD R4, PLUS
	NOT R4, R4
	ADD R4, R4, #1
	ADD R1, R0, R4
	BRz PRINT_PLUS
	OUT
	BRnzp CHECK_RANGE

NEXT
GRAB
	GETC
	ADD R1, R0, #-10
	BRz END_GRAB
	OUT
	BRnzp CHECK_RANGE
VALID_RANGE
	JSR SUB_X10_3400
	AND R1, R0, R3
	ADD R5, R5, R1
	ADD R2, R2, #-1
	BRp GRAB
END_GRAB

ADD R1, R2, #-5
BRz ERROR
ADD R1, R6, #1
BRp FINISH
NOT R5, R5
ADD R5, R5, #1

FINISH

	LD R0, BACKUP_R0_3200
	LD R1, BACKUP_R1_3200
	LD R2, BACKUP_R2_3200
	LD R3, BACKUP_R3_3200
	LD R4, BACKUP_R4_3200
	LD R6, BACKUP_R6_3200
	LD R7, BACKUP_R7_3200

	RET

;--------
;SUB DATA
;--------
BACKUP_R0_3200 .BLKW #1
BACKUP_R1_3200 .BLKW #1
BACKUP_R2_3200 .BLKW #1
BACKUP_R3_3200 .BLKW #1
BACKUP_R4_3200 .BLKW #1
BACKUP_R6_3200 .BLKW #1
BACKUP_R7_3200 .BLKW #1
introMessage .FILL x6000
errorMessage .FILL x6100
NEGATIVE .FILL #0
COUNTER .FILL #5
TO_NUM .FILL xF
PLUS .FILL #43
MINUS .FILL #45
ZERO .FILL #-48
NINE .FILL #-57


;------------------------------------------------------------------
;Subroutine: SUB_X10_3400
;Parameter (R5): Register that will hold final value
;Postcondition: The subroutine has multiplied the value in R5 by 10
;Return Value: R5
;------------------------------------------------------------------
.ORIG x3400

SUB_X10_3400
	ST R1, BACKUP_R1_3400
	ST R2, BACKUP_R2_3400
	ST R7, BACKUP_R7_3400
	
	LD R1, LOOP_COUNT
	ADD R2, R5, #0

LOOP
	ADD R5, R5, R2
	ADD R1, R1, #-1
	BRp LOOP
END_LOOP
	
	LD R1, BACKUP_R1_3400
	LD R2, BACKUP_R2_3400
	LD R7, BACKUP_R7_3400

	RET

;--------
;SUB DATA
;--------
BACKUP_R1_3400 .BLKW #1
BACKUP_R2_3400 .BLKW #1
BACKUP_R7_3400 .BLKW #1
LOOP_COUNT .FILL #9

;---------------
;END of PROGRAM
;---------------
.END
;-------------------
;PURPOSE of PROGRAM
;-------------------
