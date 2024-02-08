/*
program for finding smallest number in an array of registers
length of array -> d:20H
array starts from -> d:30H
smallest number found -> d:40H
*/

ORG 0000H
	MOV R0, #30H ;starting address of array
	MOV R1, 20H ;counter
	DEC R1 ;if there are n elements, (n-1) comparisons are to be made
	MOV B, @R0 ;B = value of first element of array
	INC R0 ;R0 now points to second element of array
	LOOP:
		MOV A, @R0 ;A now holds value of second (ith) element
		CJNE A, B, SMALLER ;if A != B, jump to SMALLER
		JMP NOTSMALLER
		SMALLER:
			JNC NOTSMALLER ;if no carry is generated, A > B, jump to NOTSMALLER
			MOV B, A ;since carry is generated, A < B
			         ;Move the value of A into B, so that B remains the smallest
		NOTSMALLER:
			INC R0 ;A >= B, nothing has to be done, check next
	DJNZ R1, LOOP ;repeat this comparison loop until R1 = 0
	MOV 40H, B ;smallest number moved to display
END