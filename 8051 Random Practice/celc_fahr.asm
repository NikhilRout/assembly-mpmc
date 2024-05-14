/*
program to convert from celcius to fahrenheit
input is given at d:20H (celcius) in hex
output is displayed at d:30H (fahrenheit) in hex
*/

ORG 0000H
	MOV A, 20H
	MOV B, #09H
	MUL AB
	MOV B, #05H
	DIV AB
	MOV B, #20H ; 32D = 00100000B = 20H
	ADD A, B
	MOV 30H, A
END
	
