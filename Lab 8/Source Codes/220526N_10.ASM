; ======================================================
; ===== 99sevseg.asm ===================================
; ===== Seven Segment Displays Port 02 =================
; ====== Index: 220526N ================================
	
	CLO		;Close unwanted windows
Start:	
	MOV	AL,B6	; 1111 1010
	OUT	02	; Send the data in AL to Port 02 (2)

	MOV	AL,FD	; 1111 1101
	OUT	02	; Send the data in AL to Port 02 (6)

	JMP	Start
	
	END
; ======================================================
