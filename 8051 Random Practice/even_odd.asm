/*
program to filter an array of registers into even and odd arrays of registers 
d:20 -> length of array
d:30H -> initial input array
d:40H -> ODD array (external memory)
d:50H -> EVEN array (external memory)
*/

ORG 0000H
	MOV R7, 20H
	MOV R0, #30H
	MOV 21H, #40H
	MOV 22H, #50H
	LOOP:
		MOV A, @R0
		JB ACC.0, ODD
                JNB ACC.0, EVENN
		ODD:
		    MOV R1, 21H
			MOV @R1, A
			INC 21H
			SJMP INCREMENT
		EVENN:
		    MOV R1, 22H
		    MOV @R1, A
			INC 22H
			SJMP INCREMENT
		INCREMENT:
			INC R0
	DJNZ R7, LOOP
END
