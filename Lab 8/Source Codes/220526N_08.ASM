; ===== CONTROL THE TRAFFIC LIGHTS =============================

	CLO		; Close unwanted windows.
	MOV AL,0	; Copy 00000000 into the AL register.
	OUT 01		; Send AL to Port One (TURN OFF).
	
			;TURN ON the traffic light
Start:
	MOV AL,84	; Copy 10000100 into the AL register.
	OUT 01		; Send AL to Port One (RED-GREEN).

	MOV 	BL,A	; Copy 10 into the BL register
Rep1:
	DEC	BL	; Decrement BL by 1
	JNZ	REP1	; Repeat until BL get 0

	MOV AL,48	; Copy 01001000 into the AL register.
	OUT 01		; Send AL to Port One (YELLOW-YELLOW).


	MOV 	BL,1	; Copy 1 into the BL register
	DEC	BL	; Decrement BL by 1

	MOV AL,30	; Copy 00110000 into the AL register.
	OUT 01		; Send AL to Port One (GREEN-RED).


	MOV 	BL,5	; Copy 5 into the BL register
Rep2:
	DEC	BL	; Decrement BL by 1 
	JNZ	REP2	; Repeat untill BL get 0

	JMP Start	; Jump back to the start.

	END		; Program ends.
	
; ===== Program Ends ==========================================

