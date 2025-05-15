				.orig x3000
	MAIN
				;This section is the MAIN for SWITCHCASE (changing letters from lowercase to uppercase and vice versa.------
				;JSR  SWITCHCASE
				;PUTS
				;HALT
				;-----------------------------------------------------------------------------------------------------------
				;This section is the MAIN for COUNTCHAR
				;LD R0, CHR			;Delete this later
				;LEA R1, STR1		;Delete me
				JSR COUNTCHAR
				HALT
				
SWITCHCASE
				ST R0, SAVE_R0
				ST R1, SAVE_R1
				ST R2, SAVE_R2
				ST R3, SAVE_R3
				ST R7, SAVE_R7
				
				;Remember, R0 has the address of the string
	LOOPING
				LDR R1, R0, #0    	;Load character in R0 into R1
				BRz FINISH          ;If the character is 0, stop

				;Check if character is lowercase
				LD R3, NEG65
				ADD R2, R1, R3		;Check if its > or equal to ASCII "a"
				BRn CHECK_UPPER		;If less, skip to check uppercase
				
				LD R3, NEG26
				ADD R2, R2, R3		;Check if < or equal to ASCII "z"
				BRp LOWERCASE
	
	CHECK_UPPER
				;Check if the character is uppercase
				LD R3, NEG65
				ADD R2, R1, R3
				BRn NEXT_CHAR		;If less, then move to the next character
				
				LD R3, NEG26
				ADD R2, R2, R3		;Check if > the ASCII "Z"
				BRp NEXT_CHAR
				
				LD R3, POS32
				ADD R1, R1, R3		;Convert to lowercase
				BR NEXT_CHAR

	LOWERCASE
				LD R3, NEG32
				ADD R1, R1, R3		;Convert to uppercase

	NEXT_CHAR
				STR R1, R0, #0		;Store modified character back
				ADD R0, R0, #1		;Move to next character
				BR LOOPING        	;Repeat
	FINISH
				;Restore all of the registers
				LD R0, SAVE_R0
				LD R1, SAVE_R1
				LD R2, SAVE_R2
				LD R3, SAVE_R3
				LD R7, SAVE_R7
				
				RET
COUNTCHAR
				ST R1, SAVE_R1C
				ST R2, SAVE_R2C
				ST R3, SAVE_R3C
				ST R4, SAVE_R4C
				ST R5, SAVE_R5C
				ST R6, SAVE_R6C
				ST R7, SAVE_R7C
				
				AND R4, R4, #0		;Initialize counter
	
				LD R5, NEG32
				ADD R3, R0, R5		;Try converting to uppercase
				BRn SET_LOWERCASE 	;???This may be the issue
				
				LD R5, POS32		
				ADD R3, R3, #0		;Lowercase
				ADD R3, R0, R5
				
	SET_LOWERCASE
				NOT R0, R0			;Make R0 negative
				ADD R0, R0, #1
				
				NOT R3, R3			;Make R3 negative
				ADD R3, R3, #1
	
	TOP
				LDR R2, R1, #0		;Load character from string
				BRz DONE
				 
				ADD R5, R0, R2		;Compare with the original case
				BRz INCREMENT
				
				ADD R6, R3, R2		;Compare with the opposite case
				BRz INCREMENT
				
				ADD R1, R1, #1		;Move pointer to the next character
				BRnzp TOP			;Continue through the loop
				
	INCREMENT
				ADD R4, R4, #1		;Increment counter
				ADD R1, R1, #1		;Move pointer to the next character
				BRnzp TOP			;Loop
	DONE
				ADD R0, R4, #0		;Move counter to R0
				
				;Restore registers
				LD R1, SAVE_R1C
				LD R2, SAVE_R2C
				LD R3, SAVE_R3C
				LD R4, SAVE_R4C
				LD R5, SAVE_R5C
				LD R6, SAVE_R6C
				LD R7, SAVE_R7C
				RET
				
;Storage locations for saved registers.
SAVE_R0			.BLKW 1
SAVE_R1			.BLKW 1
SAVE_R2			.BLKW 1
SAVE_R3			.FILL 0
SAVE_R7			.BLKW 1

SAVE_R1C		.BLKW 1
SAVE_R2C		.BLKW 1
SAVE_R3C		.BLKW 1
SAVE_R4C		.BLKW 1
SAVE_R5C		.BLKW 1
SAVE_R6C		.BLKW 1
SAVE_R7C		.BLKW 1

NEG65			.FILL -65
NEG26			.FILL -26
NEG32			.FILL -32
POS32			.FILL 32 

;DATA SECTION DELETE THE NEXT FOUR LINES BEFORE UPLOADING  
;Make sure to test for a character not in STR1.  
;			.blkw 100  ;Change this value when testing. Vary from 50 to 150. 
;STR1 		.stringz "zkfazj;iozJkfJJz" ;And, of course, change the string. 
;CHR 		.fill 'j' ; And, also of course, change the search char.

				.END