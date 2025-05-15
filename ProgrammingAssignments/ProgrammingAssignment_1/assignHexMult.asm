		.orig x3000
MAIN 
		;JSR GETHD
		;JSR GETHD
		;JSR MULT
		;JSR MULT
		JSR GETH4
		JSR GETH4
		HALT
GETHD
		;Get a valid digit 0-9, A-F, a-f. If invalid, go back to start
			st r1, gethd_sr1
			st r2, gethd_sr2
			st r7, gethd_sr7
	start	getc						;----------Beginning--------------
			ld r1, ascii_offset9
			not r1, r1
			add r1, r1, #1
			add r2, r1, r0
			brp br1 					;If the input is > 9, branch for futher analysis
			ld r1, ascii_offset0
			ld r2, ascii_offset0 
			not r2, r2
			add r2, r2, #1
			add r2, r2, r0
			brzp finish 				;If the input is = or > 0, branch to exit. It's a good character
			brn start 					;If the input is < 0, it's a bad number
	br1		ld r1, ascii_offsetF		;-----------------Section for checking A-F------------------
			not r1, r1
			add r1, r1, #1
			add r2, r1, r0
			brp br2 					;If the input is > F then branch for further checks
			ld r1, ascii_offsetConAF 	
			ld r2, ascii_offsetA
			not r2, r2
			add r2, r2, #1
			add r2, r2, r0
			brzp finish 				;If the input is = or > A, branch to finish
			brn start 					;If the input is < A, it's bad
	br2		ld r1, ascii_offsetf		;-----------------Section for checking a-f--------------------
			not r1, r1
			add r1, r1, #1
			add r1, r1, r0
			brp start 					;If the input is > f, its bad
			ld r1, ascii_offsetCon
			ld r2, ascii_offseta
			not r2, r2
			add r2, r2, #1
			add r2, r2, r0
			brn start 					;If the input is < a, go back to the start
finish			out
			not r1, r1
			add r1, r1, #1
			add r0, r0, r1
			ld r1, gethd_sr1
			ld r2, gethd_sr2
			ld r7, gethd_sr7
			ret
	;--------------------------------------------------------------
MULT
		;Firstly assume that there are values in R1 and R2
			st r1, mult_sr1
			st r2, mult_sr2
			st r7, mult_sr7
			
			and r0, r0, #0				;Clear r0
			
			add r0, r1, #0				;Check to see if swapping is necessary
			not r0, r0
			add r0, r0, #1
			add r0, r0, r2
			brnz res					;No need to swap, go to res (since r1 > r2)
			add r0, r1, #0
			and r1, r1, #0 				;Swaping the numbers around so that r1 will have the bigger number
			add r1, r2, #0
			add r2, r0, #0
			
	res		and r0, r0, #0				;Clear r0
	top
			add r0, r1, r0 				;------This section is the multiplication loop------
			not r2, r2
			add r2, r2, #1				;Decrement
			not r2, r2
			brnp top
	termino
			ld r1, mult_sr1
			ld r2, mult_sr2
			ld r7, mult_sr7
			ret
	;---------------------------------------------------------------------------
GETH4
			st r1, get4h_sr1
			st r2, get4h_sr2
			st r3, get4h_sr3
			st r7, get4h_sr7
			
			and r3, r3, #0				;Clear r3
			
			jsr GETHD					;Start with getting the first number 
			ld r1, hex_col1
			add r2, r0, #0
			jsr MULT
			add r3, r3, r0				;R3 will accumulate the result
			
			jsr GETHD					;Get the second number
			ld r1, hex_col2
			add r2, r0, #0
			jsr MULT
			add r3, r3, r0				;Accumulate the result
			
			jsr GETHD					;Get the third number
			ld r1, hex_col3
			add r2, r0, #0
			jsr MULT
			add r3, r3, r0
			
			jsr GETHD					;Get the fourth number
			ld r1, hex_col4
			add r2, r0, #0
			jsr MULT
			add r3, r3, r0
			
			ld r0, newline
			out							;Prints newline
			add r0, r3, #0				;Move final sum over to r0
			
			ld r1, get4h_sr1			;Restore registers
			ld r2, get4h_sr2
			ld r3, get4h_sr3
			ld r7, get4h_sr7
			ret
;Storage locations for saved registers:-------------------
gethd_sr1 		.fill 0
gethd_sr2 		.fill 0
gethd_sr7 		.fill 0
mult_sr1		.fill 0
mult_sr2		.fill 0
mult_sr7		.fill 0
get4h_sr1 		.fill 0
get4h_sr2 		.fill 0
get4h_sr3 		.fill 0
get4h_sr7 		.fill 0
;ASCII Constants------------------
ascii_offset0 	.fill 48
ascii_offset9 	.fill 57
ascii_offsetA 	.fill 65
ascii_offsetF 	.fill 70
ascii_offseta 	.fill 97
ascii_offsetf 	.fill 102
ascii_offsetConAF	.fill 55 			;This is used in the converion of A-F to decimal
ascii_offsetCon 	.fill 87 			;Part of what converts a-f to decimal
;This section below is for GETH4-------------------------------
hex_col1 		.fill 4096				;Reminder: The columns are refering to the powers of 16
hex_col2 		.fill 256
hex_col3 		.fill 16
hex_col4 		.fill 1
newline			.fill 10
				.end