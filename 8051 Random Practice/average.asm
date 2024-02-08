/*
program to find the average of an array of registers
length of array -> d:20H
array starts from -> d:30H
average displayed -> d:40H
*/

ORG 0000H
	MOV R1, 20H ;R1 stores the length of the array
	MOV B, R1 ;copy for length of array
	DEC R1 ;if there are n elements, (n-1) additions are to be made
	MOV A, 30H ;A will store sum of all registers. rn it is initialised
	           ;with the first element of the register array
	MOV R0, #31H; R0 will act as pointer for iterating through the array
	LOOP:
		ADD A, @R0
		INC R0 ;increase pointer value now that the element is added
	DJNZ R1, LOOP
	DIV AB ;sum/length
	MOV 40H, A ;quotient
	MOV 41H, B ;remainder
END
