;=========Factorial=============================
	CLO		;Close unwanted windows.
Start:
	MOV	AL,1	;Copy 1 to AL
	MOV	BL,5	;Copy 5 to BL
Loop:
	MUL	AL,BL	;Multiply AL and BL
	DEC	BL	;Dcrement the BL by 1
	JNZ	LOOP	;Iterate until BL is 0
	
	MOV	AL,8A	;Copy 10001010 into AL
	OUT	02	;Send AL to Port two (7)

	MOV	AL,FF	;Copy 11111111 into AL
	OUT	02	;Send AL to Port two (8)
	
	JMP	START	;Jump back to start

	END		;Program ends

;=========Program Ends==========================