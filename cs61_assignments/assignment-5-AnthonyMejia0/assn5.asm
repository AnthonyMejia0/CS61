;=================================================
; Name: Anthony Mejia
; Email: ameji012@ucr.edu
; 
; Assignment name: Assignment 5
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
MAIN
	LD R6, MENU_3200
	JSRR R6
	ADD R5, R1, #-1
	BRz GO_1
	ADD R5, R1, #-2
	BRz GO_2
	ADD R5, R1, #-3
	BRz GO_3
	ADD R5, R1, #-4
	BRz GO_4
	ADD R5, R1, #-5
	BRz GO_5
	ADD R5, R1, #-6
	BRz GO_6
	ADD R5, R1, #-7
	BRz END_MAIN
	BRnzp MAIN

GO_1
	LD R6, ALL_MACHINES_BUSY_3400
	JSRR R6
	ADD R5, R2, #-1
	BRn NOT_ALLBUSY
	LEA R0, ALLBUSY
	PUTS
	BRnzp MAIN
NOT_ALLBUSY
	LEA R0, ALLNOTBUSY
	PUTS
	BRnzp MAIN

GO_2
	LD R6, ALL_MACHINES_FREE_3600
	JSRR R6
	ADD R5, R2, #-1
	BRn NOT_ALLFREE
	LEA R0, FREE
	PUTS
	BRnzp MAIN
NOT_ALLFREE
	LEA R0, NOTFREE
	PUTS
	BRnzp MAIN

GO_3
	LD R6, NUM_BUSY_MACHINES_3800
	JSRR R6
	LEA R0, BUSYMACHINE1
	PUTS
	ADD R5, R2, #0
	LD R6, PRINT_NUMBER_4600
	JSRR R6
	LEA R0, BUSYMACHINE2
	PUTS
	BRnzp MAIN

GO_4
	LD R6, NUM_FREE_MACHINES_4000
	JSRR R6
	LEA R0, FREEMACHINE1
	PUTS
	ADD R5, R2, #0
	LD R6, PRINT_NUMBER_4600
	JSRR R6
	LEA R0, FREEMACHINE2
	PUTS
	BRnzp MAIN

GO_5
	LD R6, GET_INPUT_4800
	JSRR R6
	LEA R0, STATUS1
	PUTS
	ADD R5, R1, #0
	LD R6, PRINT_NUMBER_4600
	JSRR R6
	LD R6, MACHINE_STATUS_4200
	JSRR R6
	ADD R2, R2, #-1
	BRz IS_NOT_BUSY
IS_BUSY
	LEA R0, STATUS2
	PUTS
	BRnzp MAIN

IS_NOT_BUSY
	LEA R0, STATUS3
	PUTS
	BRnzp MAIN

GO_6
	LD R6, FIRST_FREE_4400
	JSRR R6
	ADD R2, R2, #0
	ADD R5, R2, #-15
	BRp NONE_FREE
	LEA R0, FIRSTFREE
	PUTS
	ADD R5, R2, #0
	LD R6, PRINT_NUMBER_4600
	JSRR R6
	LEA R0, FIRSTFREE2
	PUTS
	BRnzp MAIN

NONE_FREE
	LEA R0, FIRSTFREE3
	PUTS
	BRnzp MAIN

END_MAIN
	LEA R0, Goodbye
	PUTS

HALT
;---------------	
;Data
;---------------
;Add address for subroutines
MENU_3200 .FILL x3200
ALL_MACHINES_BUSY_3400 .FILL x3400
ALL_MACHINES_FREE_3600 .FILL x3600
NUM_BUSY_MACHINES_3800 .FILL x3800
NUM_FREE_MACHINES_4000 .FILL x4000
MACHINE_STATUS_4200 .FILL x4200
FIRST_FREE_4400 .FILL x4400
GET_INPUT_4800 .FILL x4800
PRINT_NUMBER_4600 .FILL x4600

;Strings for options
Goodbye .Stringz "Goodbye!\n"
ALLNOTBUSY .Stringz "Not all machines are busy\n"
ALLBUSY .Stringz "All machines are busy\n"
FREE .STRINGZ "All machines are free\n"
NOTFREE .STRINGZ "Not all machines are free\n"
BUSYMACHINE1 .STRINGZ "There are "
BUSYMACHINE2 .STRINGZ " busy machines\n"
FREEMACHINE1 .STRINGZ "There are "
FREEMACHINE2 .STRINGZ " free machines\n"
STATUS1 .STRINGZ "Machine "
STATUS2  .STRINGZ " is busy\n"
STATUS3 .STRINGZ " is free\n"
FIRSTFREE .STRINGZ "The first available machine is number "
FIRSTFREE2 .STRINGZ "\n"
FIRSTFREE3 .STRINGZ "No machines are free\n"


;------------------------------------------------------------------------------------------
; Subroutine: MENU_3200
; Inputs: None
; Postcondition: The subroutine has printed out a menu with numerical options, allowed the
;                          user to select an option, and returned the selected option.
; Return Value (R1): The option selected:  #1, #2, #3, #4, #5, #6 or #7
; no other return value is possible
;------------------------------------------------------------------------------------------
;-------------------------------
;INSERT CODE For Subroutine MENU
;--------------------------------
.ORIG x3200

ST R0, BACKUP_R0_3200
ST R2, BACKUP_R2_3200
ST R3, BACKUP_R3_3200
ST R4, BACKUP_R4_3200
ST R5, BACKUP_R5_3200
ST R6, BACKUP_R6_3200
ST R7, BACKUP_R7_3200

BRnzp START

VALIDATE
	LD R3, ONE
	ADD R2, R1, R3
	BRn ERROR
	LD R3, SEVEN
	ADD R2, R1, R3
	BRp ERROR
	LD R3, TO_NUM
	AND R1, R1, R3
	BRnzp VALID

ERROR
	LEA R0, Error_message_1
	PUTS
	BRnzp START

START
	LD R0, Menu_string_addr
	puts
	GETC
	ADD R1, R0, #0
	OUT
	LD R0, NEWLINE
	OUT
	ADD R1, R1, #0
	BRnzp VALIDATE
VALID

LD R0, BACKUP_R0_3200
LD R2, BACKUP_R2_3200
LD R3, BACKUP_R3_3200
LD R4, BACKUP_R4_3200
LD R5, BACKUP_R5_3200
LD R6, BACKUP_R6_3200
LD R7, BACKUP_R7_3200

RET

;--------------------------------
;Data for subroutine MENU
;--------------------------------
Error_message_1 .STRINGZ "INVALID INPUT\n"
Menu_string_addr .FILL x6000
NEWLINE .FILL x0A
BACKUP_R0_3200 .BLKW #1
BACKUP_R2_3200 .BLKW #1
BACKUP_R3_3200 .BLKW #1
BACKUP_R4_3200 .BLKW #1
BACKUP_R5_3200 .BLKW #1
BACKUP_R6_3200 .BLKW #1
BACKUP_R7_3200 .BLKW #1
TO_NUM .FILL x0F
ONE .FILL #-49
TWO .FILL #-50
THREE .FILL #-51
FOUR .FILL #-52
FIVE .FILL #-53
SIX .FILL #-54
SEVEN .FILL #-55

;-----------------------------------------------------------------------------------------------------------------
; Subroutine: ALL_MACHINES_BUSY_3400
; Inputs: None
; Postcondition: The subroutine has returned a value indicating whether all machines are busy
; Return value (R2): 1 if all machines are busy,    0 otherwise
;-----------------------------------------------------------------------------------------------------------------
;-------------------------------
;INSERT CODE For Subroutine ALL_MACHINES_BUSY
;--------------------------------
.ORIG x3400

ST R0, BACKUP_R0_3400
ST R1, BACKUP_R1_3400
ST R3, BACKUP_R3_3400
ST R4, BACKUP_R4_3400
ST R5, BACKUP_R5_3400
ST R6, BACKUP_R6_3400
ST R7, BACKUP_R7_3400

AND R2, R2, #0

LDI R4, BUSYNESS_ADDR_ALL_MACHINES_BUSY 
BRz ALL_BUSY
BRnp END_ALL_BUSY

ALL_BUSY
	ADD R2, R2, #1
	BRnzp END_ALL_BUSY

END_ALL_BUSY

LD R0, BACKUP_R0_3400
LD R1, BACKUP_R1_3400
LD R3, BACKUP_R3_3400
LD R4, BACKUP_R4_3400
LD R5, BACKUP_R5_3400
LD R6, BACKUP_R6_3400
LD R7, BACKUP_R7_3400

RET

;--------------------------------
;Data for subroutine ALL_MACHINES_BUSY
;--------------------------------
BUSYNESS_ADDR_ALL_MACHINES_BUSY .Fill xD000
BACKUP_R0_3400 .BLKW #1
BACKUP_R1_3400 .BLKW #1
BACKUP_R3_3400 .BLKW #1
BACKUP_R4_3400 .BLKW #1
BACKUP_R5_3400 .BLKW #1
BACKUP_R6_3400 .BLKW #1
BACKUP_R7_3400 .BLKW #1

;-----------------------------------------------------------------------------------------------------------------
; Subroutine: ALL_MACHINES_FREE_3600
; Inputs: None
; Postcondition: The subroutine has returned a value indicating whether all machines are free
; Return value (R2): 1 if all machines are free,    0 otherwise
;-----------------------------------------------------------------------------------------------------------------
;-------------------------------
;INSERT CODE For Subroutine ALL_MACHINES_FREE
;--------------------------------
.ORIG x3600

ST R0, BACKUP_R0_3600
ST R1, BACKUP_R1_3600
ST R3, BACKUP_R3_3600
ST R4, BACKUP_R4_3600
ST R5, BACKUP_R5_3600
ST R6, BACKUP_R6_3600
ST R7, BACKUP_R7_3600

AND R2, R2, #0

LDI R5, BUSYNESS_ADDR_ALL_MACHINES_FREE
ADD R6, R5, #1
BRz ALL_FREE
BRnzp END_ALL_FREE
ALL_FREE
	ADD R2, R2, #1
	BRnzp END_ALL_FREE
END_ALL_FREE

LD R0, BACKUP_R0_3600
LD R1, BACKUP_R1_3600
LD R3, BACKUP_R3_3600
LD R4, BACKUP_R4_3600
LD R5, BACKUP_R5_3600
LD R6, BACKUP_R6_3600
LD R7, BACKUP_R7_3600

RET

;--------------------------------
;Data for subroutine ALL_MACHINES_FREE
;--------------------------------
BUSYNESS_ADDR_ALL_MACHINES_FREE .Fill xD000
BACKUP_R0_3600 .BLKW #1
BACKUP_R1_3600 .BLKW #1
BACKUP_R3_3600 .BLKW #1
BACKUP_R4_3600 .BLKW #1
BACKUP_R5_3600 .BLKW #1
BACKUP_R6_3600 .BLKW #1
BACKUP_R7_3600 .BLKW #1

;-----------------------------------------------------------------------------------------------------------------
; Subroutine: NUM_BUSY_MACHINES_3800
; Inputs: None
; Postcondition: The subroutine has returned the number of busy machines.
; Return Value (R2): The number of machines that are busy
;-----------------------------------------------------------------------------------------------------------------
;-------------------------------
;INSERT CODE For Subroutine NUM_BUSY_MACHINES
;--------------------------------
.ORIG x3800

ST R0, BACKUP_R0_3800
ST R1, BACKUP_R1_3800
ST R3, BACKUP_R3_3800
ST R4, BACKUP_R4_3800
ST R5, BACKUP_R5_3800
ST R6, BACKUP_R6_3800
ST R7, BACKUP_R7_3800

LD R1, COUNTER
AND R2, R2, #0
LDI R5, BUSYNESS_ADDR_NUM_BUSY_MACHINES
BRnzp SHIFT_LEFT

ADD_1
	ADD R2, R2, #1
	BRnzp CONTINUE_SHIFT

SHIFT_LEFT
	ADD R5, R5, #0
	BRzp ADD_1
CONTINUE_SHIFT
	ADD R5, R5, R5
	ADD R1, R1, #-1
	BRp SHIFT_LEFT
END_SHIFT_LEFT



LD R0, BACKUP_R0_3800
LD R1, BACKUP_R1_3800
LD R3, BACKUP_R3_3800
LD R4, BACKUP_R4_3800
LD R5, BACKUP_R5_3800
LD R6, BACKUP_R6_3800
LD R7, BACKUP_R7_3800

RET

;--------------------------------
;Data for subroutine NUM_BUSY_MACHINES
;--------------------------------
BUSYNESS_ADDR_NUM_BUSY_MACHINES .Fill xD000
BACKUP_R0_3800 .BLKW #1
BACKUP_R1_3800 .BLKW #1
BACKUP_R3_3800 .BLKW #1
BACKUP_R4_3800 .BLKW #1
BACKUP_R5_3800 .BLKW #1
BACKUP_R6_3800 .BLKW #1
BACKUP_R7_3800 .BLKW #1
COUNTER .FILL #16


;-----------------------------------------------------------------------------------------------------------------
; Subroutine: NUM_FREE_MACHINES_4000
; Inputs: None
; Postcondition: The subroutine has returned the number of free machines
; Return Value (R2): The number of machines that are free 
;-----------------------------------------------------------------------------------------------------------------
;-------------------------------
;INSERT CODE For Subroutine NUM_FREE_MACHINES
;--------------------------------
.ORIG x4000

ST R0, BACKUP_R0_4000
ST R1, BACKUP_R1_4000
ST R3, BACKUP_R3_4000
ST R4, BACKUP_R4_4000
ST R5, BACKUP_R5_4000
ST R6, BACKUP_R6_4000
ST R7, BACKUP_R7_4000

LD R1, COUNTER_4000
AND R2, R2, #0
LDI R5, BUSYNESS_ADDR_NUM_FREE_MACHINES
BRnzp SHIFT_LEFT_4000

ADD_1_4000
	ADD R2, R2, #1
	BRnzp CONTINUE_SHIFT_4000

SHIFT_LEFT_4000
	ADD R5, R5, #0
	BRn ADD_1_4000
CONTINUE_SHIFT_4000
	ADD R5, R5, R5
	ADD R1, R1, #-1
	BRp SHIFT_LEFT_4000
END_SHIFT_LEFT_4000

LD R0, BACKUP_R0_4000
LD R1, BACKUP_R1_4000
LD R3, BACKUP_R3_4000
LD R4, BACKUP_R4_4000
LD R5, BACKUP_R5_4000
LD R6, BACKUP_R6_4000
LD R7, BACKUP_R7_4000

RET

;--------------------------------
;Data for subroutine NUM_FREE_MACHINES
;--------------------------------
BUSYNESS_ADDR_NUM_FREE_MACHINES .Fill xD000
BACKUP_R0_4000 .BLKW #1
BACKUP_R1_4000 .BLKW #1
BACKUP_R3_4000 .BLKW #1
BACKUP_R4_4000 .BLKW #1
BACKUP_R5_4000 .BLKW #1
BACKUP_R6_4000 .BLKW #1
BACKUP_R7_4000 .BLKW #1
COUNTER_4000 .FILL #16


;-----------------------------------------------------------------------------------------------------------------
; Subroutine: MACHINE_STATUS_4200
; Input (R1): Which machine to check
; Postcondition: The subroutine has returned a value indicating whether the machine indicated
;                          by (R1) is busy or not.
; Return Value (R2): 0 if machine (R1) is busy, 1 if it is free
;-----------------------------------------------------------------------------------------------------------------
;-------------------------------
;INSERT CODE For Subroutine MACHINE_STATUS
;--------------------------------
.ORIG x4200

ST R0, BACKUP_R0_4200
ST R1, BACKUP_R1_4200
ST R3, BACKUP_R3_4200
ST R4, BACKUP_R4_4200
ST R5, BACKUP_R5_4200
ST R6, BACKUP_R6_4200
ST R7, BACKUP_R7_4200

LDI R5, BUSYNESS_ADDR_MACHINE_STATUS
LD R3, COUNTER_4200
NOT R1, R1
ADD R1, R1, #1
ADD R4, R3, R1
BRnzp GET_MACHINE

MAKE_1
	AND R2, R2, #0
	ADD R2, R2, #1
	BRnzp CONTINUE_GET_MACHINE

MAKE_0
	AND R2, R2, #0
	BRnzp CONTINUE_GET_MACHINE

GET_MACHINE
	ADD R5, R5, #0
	BRn MAKE_1
	BRzp MAKE_0
CONTINUE_GET_MACHINE
	ADD R5, R5, R5
	ADD R4, R4, #-1
	BRzp GET_MACHINE
END_GET_MACHINE

LD R0, BACKUP_R0_4200
LD R1, BACKUP_R1_4200
LD R3, BACKUP_R3_4200
LD R4, BACKUP_R4_4200
LD R5, BACKUP_R5_4200
LD R6, BACKUP_R6_4200
LD R7, BACKUP_R7_4200

RET

;--------------------------------
;Data for subroutine MACHINE_STATUS
;--------------------------------
BUSYNESS_ADDR_MACHINE_STATUS .Fill xD000
BACKUP_R0_4200 .BLKW #1
BACKUP_R1_4200 .BLKW #1
BACKUP_R3_4200 .BLKW #1
BACKUP_R4_4200 .BLKW #1
BACKUP_R5_4200 .BLKW #1
BACKUP_R6_4200 .BLKW #1
BACKUP_R7_4200 .BLKW #1
COUNTER_4200 .FILL #15

;-----------------------------------------------------------------------------------------------------------------
; Subroutine: FIRST_FREE_4400
; Inputs: None
; Postcondition: 
; The subroutine has returned a value indicating the lowest numbered free machine
; Return Value (R2): the number of the free machine
;-----------------------------------------------------------------------------------------------------------------
;-------------------------------
;INSERT CODE For Subroutine FIRST_FREE
;--------------------------------
.ORIG x4400

ST R0, BACKUP_R0_4400
ST R1, BACKUP_R1_4400
ST R3, BACKUP_R3_4400
ST R4, BACKUP_R4_4400
ST R5, BACKUP_R5_4400
ST R6, BACKUP_R6_4400
ST R7, BACKUP_R7_4400

LD R1, COUNTER_4400
ADD R2, R1, #1
LDI R5, BUSYNESS_ADDR_FIRST_FREE
BRnzp FIND_FREE

UPDATE_LOCATION
	ADD R2, R1, #0
	BRnzp UPDATED

FIND_FREE
	ADD R5, R5, #0
	BRn UPDATE_LOCATION
UPDATED
	ADD R5, R5, R5
	ADD R1, R1, #-1
	BRzp FIND_FREE
DONE_SEARCHING

LD R0, BACKUP_R0_4400
LD R1, BACKUP_R1_4400
LD R3, BACKUP_R3_4400
LD R4, BACKUP_R4_4400
LD R5, BACKUP_R5_4400
LD R6, BACKUP_R6_4400
LD R7, BACKUP_R7_4400

RET

;--------------------------------
;Data for subroutine FIRST_FREE
;--------------------------------
BUSYNESS_ADDR_FIRST_FREE .Fill xD000
BACKUP_R0_4400 .BLKW #1
BACKUP_R1_4400 .BLKW #1
BACKUP_R3_4400 .BLKW #1
BACKUP_R4_4400 .BLKW #1
BACKUP_R5_4400 .BLKW #1
BACKUP_R6_4400 .BLKW #1
BACKUP_R7_4400 .BLKW #1
COUNTER_4400 .FILL #15

;-----------------------------------------------------------------------------------------------------------------
; Subroutine: Get input
; Inputs: None
; Postcondition: 
; The subroutine get up to a 5 digit input from the user within the range [-32768,32767]
; Return Value (R1): The value of the contructed input
; NOTE: This subroutine should be the same as the one that you did in assignment 5
;	to get input from the user, except the prompt is different.
;-----------------------------------------------------------------------------------------------------------------
;-------------------------------
;INSERT CODE For Subroutine 
;--------------------------------
.ORIG x4800

	ST R0, BACKUP_R0_4800
	ST R2, BACKUP_R2_4800
	ST R3, BACKUP_R3_4800
	ST R4, BACKUP_R4_4800
	LD R5, BACKUP_R5_4800
	ST R6, BACKUP_R6_4800
	ST R7, BACKUP_R7_4800
	
	LD R2, COUNTER_4800
	LD R3, TO_NUM_4800
	BRnzp GO

SET_FLAG
	OUT
	ADD R6, R6, #-1
	BRnzp NEXT
PRINT_PLUS
	OUT
	BRnzp NEXT
CHECK_RANGE
	LD R1, ZERO_4800
	ADD R1, R0, R1
	BRn ERROR_4800
	LD R1, NINE_4800
	ADD R1, R0, R1
	BRp ERROR_4800
	BRnzp VALID_RANGE
ERROR_4800
	LD R0, NEWLINE_4800
	OUT
	LEA R0, Error_message_2
	PUTS
	BRnzp GO
GO
	LEA R0, prompt
	PUTS
	LD R2, COUNTER_4800
	AND R5, R5, #0
	LD R6, NEGATIVE_4800
	
	GETC
	LD R4, MINUS_4800
	NOT R4, R4
	ADD R4, R4, #1
	ADD R1, R0, R4
	BRz SET_FLAG
	LD R4, PLUS_4800
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
	LD R4, SUB_X10_5000
	JSRR R4
	AND R1, R0, R3
	ADD R5, R5, R1
	ADD R2, R2, #-1
	BRp GRAB
END_GRAB

ADD R1, R2, #-5
BRz ERROR_4800
ADD R1, R6, #1
BRp FINISH
NOT R5, R5
ADD R5, R5, #1

FINISH

ADD R1, R5, #0
ADD R5, R1, #0
BRn ERROR_4800
ADD R5, R1, #-15
BRp ERROR_4800

LD R0, NEWLINE_4800
OUT

	LD R0, BACKUP_R0_4800
	LD R2, BACKUP_R2_4800
	LD R3, BACKUP_R3_4800
	LD R4, BACKUP_R4_4800
	LD R5, BACKUP_R5_4800
	LD R6, BACKUP_R6_4800
	LD R7, BACKUP_R7_4800

	RET

;--------------------------------
;Data for subroutine Get input
;--------------------------------
prompt .STRINGZ "Enter which machine you want the status of (0 - 15), followed by ENTER: "
Error_message_2 .STRINGZ "ERROR INVALID INPUT\n"
SUB_X10_5000 .FILL x5000
BACKUP_R0_4800 .BLKW #1
BACKUP_R2_4800 .BLKW #1
BACKUP_R3_4800 .BLKW #1
BACKUP_R4_4800 .BLKW #1
BACKUP_R5_4800 .BLKW #1
BACKUP_R6_4800 .BLKW #1
BACKUP_R7_4800 .BLKW #1
NEGATIVE_4800 .FILL #0
COUNTER_4800 .FILL #5
TO_NUM_4800 .FILL xF
PLUS_4800 .FILL #43
MINUS_4800 .FILL #45
ZERO_4800 .FILL #-48
NINE_4800 .FILL #-57
NEWLINE_4800 .FILL x0A


;------------------------------------------------------------------
;Subroutine: SUB_X10_5000
;Parameter (R5): Register that will hold final value
;Postcondition: The subroutine has multiplied the value in R5 by 10
;Return Value: R5
;------------------------------------------------------------------
.ORIG x5000

	ST R1, BACKUP_R1_5000
	ST R2, BACKUP_R2_5000
	ST R7, BACKUP_R7_5000
	
	LD R1, LOOP_COUNT_5000
	ADD R2, R5, #0

LOOP
	ADD R5, R5, R2
	ADD R1, R1, #-1
	BRp LOOP
END_LOOP
	
	LD R1, BACKUP_R1_5000
	LD R2, BACKUP_R2_5000
	LD R7, BACKUP_R7_5000

	RET

;--------
;SUB DATA
;--------
BACKUP_R1_5000 .BLKW #1
BACKUP_R2_5000 .BLKW #1
BACKUP_R7_5000 .BLKW #1
LOOP_COUNT_5000 .FILL #9
	
;-----------------------------------------------------------------------------------------------------------------
; Subroutine: print number
; Inputs: 
; Postcondition: 
; The subroutine prints the number that is in R5
; Return Value :
; NOTE: This subroutine should print the number to the user WITHOUT 
;		leading 0's and DOES NOT output the '+' for positive numbers.
;-----------------------------------------------------------------------------------------------------------------
;-------------------------------
;INSERT CODE For Subroutine 
;--------------------------------
.ORIG x4600

SUB_PRINT_4600
	ST R1, BACKUP_R1_4600
	ST R2, BACKUP_R2_4600
	ST R5, BACKUP_R5_4600
 	ST R7, BACKUP_R7_4600

	ADD R5, R5, #0
PROCEED
	AND R2, R2, #0

DIGIT_1
	LD R1, NEG_TEN_K
	ADD R5, R5, R1
	BRn END_DIGIT_1
	ADD R2, R2, #1
	BRzp DIGIT_1
END_DIGIT_1	
	LD R1, TEN_K
	ADD R5, R5, R1
	ADD R2, R2, #0
	BRz DIGIT_2
	LD R1, MASK
	ADD R2, R2, R1
	ADD R0, R2, #0

	AND R2, R2, #0

DIGIT_2
	LD R1, NEG_K
	ADD R5, R5, R1
	BRn END_DIGIT_2
	ADD R2, R2, #1
	BRzp DIGIT_2
END_DIGIT_2	
	LD R1, K
	ADD R5, R5, R1
	LD R1, MASK
	ADD R2, R2, R1
	ADD R0, R2, #0

	AND R2, R2, #0

DIGIT_3
	LD R1, NEG_H
	ADD R5, R5, R1
	BRn END_DIGIT_3
	ADD R2, R2, #1
	BRzp DIGIT_3
END_DIGIT_3	
	LD R1, H
	ADD R5, R5, R1
	LD R1, MASK
	ADD R2, R2, R1
	ADD R0, R2, #0

	AND R2, R2, #0

DIGIT_4
	LD R1, NEG_TEN
	ADD R5, R5, R1
	BRn END_DIGIT_4
	ADD R2, R2, #1
	BRzp DIGIT_4
END_DIGIT_4	
	LD R1, TEN
	ADD R5, R5, R1
	LD R1, MASK
	ADD R2, R2, #0
	BRz DIGIT_5
	ADD R2, R2, R1
	ADD R0, R2, #0
	OUT

	AND R2, R2, #0

DIGIT_5
	LD R1, NEG_ONE
	ADD R5, R5, R1
	BRn END_DIGIT_5
	ADD R2, R2, #1
	BRzp DIGIT_5
END_DIGIT_5	
	LD R1, ONE_4600
	ADD R5, R5, R1
	LD R1, MASK
	ADD R2, R2, R1
	ADD R0, R2, #0
	OUT

	LD R1, BACKUP_R1_4600
	LD R2, BACKUP_R2_4600
	LD R5, BACKUP_R5_4600
 	LD R7, BACKUP_R7_4600

	RET

;--------------------------------
;Data for subroutine print number
;--------------------------------
BACKUP_R1_4600 .BLKW #1
BACKUP_R2_4600 .BLKW #1
BACKUP_R5_4600 .BLKW #1
BACKUP_R7_4600 .BLKW #1
MASK .FILL x30
TEN_K .FILL #10000
NEG_TEN_K .FILL #-10000
K .FILL #1000
NEG_K .FILL #-1000
H .FILL #100
NEG_H .FILL #-100
TEN .FILL #10
NEG_TEN .FILL #-10
ONE_4600 .FILL #1
NEG_ONE .FILL #-1


.ORIG x6000
MENUSTRING .STRINGZ "**********************\n* The Busyness Server *\n**********************\n1. Check to see whether all machines are busy\n2. Check to see whether all machines are free\n3. Report the number of busy machines\n4. Report the number of free machines\n5. Report the status of machine n\n6. Report the number of the first available machine\n7. Quit\n"

.ORIG xD000			; Remote data
BUSYNESS .FILL xABCD		; <----!!!VALUE FOR BUSYNESS VECTOR!!!

;---------------	
;END of PROGRAM
;---------------	
.END
