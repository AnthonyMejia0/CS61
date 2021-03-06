;=================================================
; Name: Anthony Mejia
; Email: ameji012@ucr.edu
; 
; Assignment name: Assignment 2
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

;----------------------------------------------
;outputs prompt
;----------------------------------------------	
LEA R0, intro			; 
PUTS				; Invokes BIOS routine to output string

;-------------------------------
;INSERT CODE STARTING FROM HERE
;--------------------------------
LD R1, DEC_0
LD R2, DEC_0
LD R3, MASK
LD R4, DEC_0

GETC
ADD R1, R0, #0
OUT
LEA R0, NEWLINE
PUTS
GETC
OUT
ADD R2, R0, #0
LEA R0, NEWLINE
PUTS
ADD R0, R1, #0
OUT
LEA R0, MINUS
PUTS
ADD R0, R2, #0
OUT
LEA R0, EQUALS
PUTS

AND R1, R1, R3
AND R2, R2, R3

NOT R2, R2
ADD R2, R2, #1

ADD R4, R2, R1

BRn IS_NEGATIVE
BRzp DONE

IS_NEGATIVE LEA R0, NEGATIVE
PUTS
ADD R4, R4, #-1
NOT R4, R4

DONE
ADD R0, R4, #0
LD R3, MASK_2
ADD R0, R0, R3
OUT
LEA R0, NEWLINE
PUTS


HALT				; Stop execution of program
;------	
;Data
;------
EQUALS .STRINGZ " = "
MINUS .STRINGZ " - "
NEGATIVE .STRINGZ "-"
MASK .FILL xF
MASK_2 .FILL x30
DEC_0 .FILL #0

; String to explain what to input 
intro .STRINGZ	"ENTER two numbers (i.e '0'....'9')\n" 
NEWLINE .STRINGZ "\n"	; String that holds the newline character



;---------------	
;END of PROGRAM
;---------------	
.END

