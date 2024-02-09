/*
sorting an array of registers in descending order
d:20H -> length of array
d:30H -> starting address of array of registers
sort back into the same locations
*/

ORG 0000H
	MOV R7, 20H ;initializing outer loop counter R7 with array length
	OUTERLOOP:
		MOV R0, #30H ;initialzing inner loop pointer to the start of the array
		MOV R6, 20H ;initializing inner loop counter R6 with array length
		INNERLOOP:
			MOV A, @R0 ;value at the current pointer address is moved into A
			INC R0 ;incrementing pointer to point to the next element
			MOV 50H, @R0 ;moving value at next address to register 50H for CJNE
			             ;cant CLNE A, @R0 directly
			CJNE A, 50H, NOTEQUAL ;if A is not equal to @R0 then jump to NOTEQUAL
			SJMP DONOTHING ;don't have to do anything cause consecutive elements are equal
			NOTEQUAL:
				JNC DONOTHING ;if no carry is generated A > 50H
				             ;already in descending order, do nothing
				;if its neither = nor >, its < so swap elements
				MOV @R0, A ;the second address now has the first elements value
				DEC R0 ;pointer going back to first element
				MOV @R0, 50H ;the first address now has the second elements value
			DONOTHING:
		DJNZ R6, INNERLOOP
	DJNZ R7, OUTERLOOP
END