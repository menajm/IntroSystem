		.orig x3000
MAIN 
		JSR GETNUM
		JSR GETNUM
		HALT
							;Below is the subroutine
GETNUM
							;Save registers: R1, R2 and R7
		ST R1, G_SR
		ST R2, G_SR2	
		ST R7, G_SR7
		
GETNUM_LOOP					;Beginning of the loop for an invalid input
		GETC
							;Ensure the input is valid by subtracting the number by 48. This would ensure an ASCII value isn't saved
		LD R1, CONST		;CONST holds -48
		ADD R0, R0, R1
	
		BRn GETNUM_LOOP 	;Get another character if R0 < 0
		
		ADD R2, R0, #-10	;If R0 >= 10, get another character
		BRzp GETNUM_LOOP
		
							;Restore registers:
		LD R1, G_SR
		LD R2, G_SR2
		LD R7, G_SR7
		RET					;Returns from the subroutine. Valid number in R0
							;Storage locations for saved registers
G_SR	.fill 	0
G_SR2	.fill   0
G_SR7	.fill   0
CONST   .fill   #-48

		.end