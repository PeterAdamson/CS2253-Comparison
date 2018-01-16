ENTRY
START
	mov	R0,#list	;R0 points to list
	mov	R1,#0		;i=0
	mov	R12,#endlist 	;R12 points to endlist
	sub	R2,R12,R0       ;j=end of list + 4
	sub	R2,R2,#4	;j=end of list
L1	ldr	R3,[R0,R1]	;R3 contains the ith element in list
	cmp	R3,#0		;compares R3 to 0
	ldrGE	R4,[R0,R2]	;places the element in list at location j in R4 if R3 is greater than or equal to 0
	strGE	R3,[R0,R2]	;stores the element in R3 at location j in list if R3 is greater than or equal to 0
	strGE	R4,[R0,R1]	;stores the element in R4 at location i in list if R3 is greater than or equal to 0
	subGE	R2,R2,#4	;decrements j by 1 if R3 is greater than or equal to 0
	addLT	R1,R1,#4	;increments i by 1 if R3 is less than 0
	cmp	R1,R2		;compares i and j
	BEQ	End1		;if i and j are equal, end the loop
	B	L1  		;otherwise, loop again
End1
STOP	B	STOP
		
list		DCD		45,-34,-20,-3,60,100,-1,-10,34,5,8,-8,15,27
endlist		SPACE		0
