ORG 0000H
MOV R0, #40H
MOV R1, #51H
MOV A, @R0
MOV R2, A
INC R0
L1: MOV A, @R0
    XCH A, @R1
    MOV @R0, A
    INC R0
    INC R1
    DJNZ R2, L1
END
