/* 
 * FileName: displayDiamond.s
 * Author: Sanskriti Mehta 
 * Userid: cs30xkt
 * Description: SPARC assembly routine which creates a diamond based on the
 *              width, height, border and diamond types and sizes. All
 *		four values are specified by users, with border and diamond
 *		shapes specified through ASCII codes.
 *              Called from main()
 * Date: April 13, 2014
 * Sources of Help: Class notes, discussion section, tutors for this class
 *
 */
 
      .global displayDiamond ! Declares the symbol to be globaly visible so
                             ! we can call this function from other modules.

      .section ".text"       ! The text segment begins here

/*
 * Function name: displayDiamond()
 * Function protype: void displayDiamond(long width, long height, 
 *                   long borderCh, long diamondCh);
 * Description: creates a diamond shape using 2 ASCII characters, with
 *              specific heights and widths, which are made through several
 *              loops among each other.
 *              
 * Parameters:
 *      arg 1: long width -- Diamond width
 *      arg 2: long height -- Diamond height
 *      arg 3: long borderCh -- ASCII value (symbol) for border
 *      arg 4: long DiamondCh -- ASCII value (symbol) for Diamond
 *
 * Side Effects: prints a diamond
 * Error Conditions: no errors in displaying the diamond, but there are 
 *                   specific rules for the 4 arguments that if the user
 *                   violates than main will prompt error messages. 
 * Return Value: N/A
 *
 * Registers Used:
 *     %i0 - arg1 -- width of diamond
 *     %i1 - arg2 -- height of diamond
 *     %i2 - arg3 -- borderCh
 *     %i3 - arg4 -- diamondch
 *
 *     %l0 -- row value
 *     %l1 -- column value
 *     %l2 -- OUTER border
 *     %l3 -- INNER diamond
 *     %l5 -- height-2 function
 *
 *     output registars for subtraction, addition, and dividing: 
 *
 *     %o0 - output registar to hold values
 *     %o1 - output registar 2 to hold values 
 */


OFFSET = 2			! for increments and decrements
NL = '\n'			! newline character


displayDiamond:
	save	%sp, -96, %sp	! save callers window

topRow:
	mov	1, %l1		! set column to 1
	cmp	%l1, %i0	! compare column and width
	bg	exit		! if greater than exit out
	nop			! Delay slot for call instruction

topRowLoop:
	mov	%i2, %o0	! set OUTER border to output registar
	call	printChar	! call printChar on output registar
	nop			! Delay slot for call instruction

	inc	%l1		! increment  column by 1
	cmp	%l1, %i0	! compare column and width
	ble	topRowLoop	! repeat loop again
	nop			! Delay slot for call instruction

end_loop:
	mov	NL, %o0		! send newline function to output registar
	call	printChar	! call printchar on output registar to execute
				! newline
	nop			! Delay slot for call instruction

topHalf:
	mov	1, %l0		! set row to one	
	sub	%i1, OFFSET,%l5 ! subtract 2 from height, save that value to
				! another local registar
	cmp	%l0, %l5	! compare row to that local registar 
	bg	exit		! if greater than exit out
	nop			! Delay slot for call instruction

firstInner:
	sub	%i0, %l0, %l2 	! subtract width from row, and save into OUTER
				! border registar
	mov	%l2, %o0	! move value of OUTER border to output registar
	mov	OFFSET, %o1	! move 2 to second output registar
	call	.div		! divide first output registar from second
	nop			! Delay slot for call instruction

	mov	%o0,%l2		! set divided value into outer
	cmp	%l2, 1		! compare outer value to one
	bl	exit		! if less than exit out
	nop			! Delay slot for call instruction
	
firstInnerLoop:
	mov	%i2, %o0	! move outerCh to output registar 
	call	printChar	! call printChar on output registar
	nop			! Delay slot for call instruction

	sub	%l2, 1, %l2 	! decrement outer
	cmp	%l2, 1		! compare outer and one
	bge	firstInnerLoop	! if greater or equal to repeat loop
	nop			! Delay slot for call instruction
	
secondInner:
	mov 	1, %l3		! set inner to one	
	cmp 	%l3, %l0	! compare inner and row
	bg	exit		! if greater than exit out
	nop			! Delay slot for call instruction

secondInnerLoop:
	mov	%i3, %o0	! move inner to output registar
	call	printChar	! call printChar on output registar
	nop			! Delay slot for call instruction

	add	%l3, 1, %l3 	! increment inner
	cmp 	%l3, %l0	! compare inner and row
	ble	secondInnerLoop	! if less or equal to repeat loop
	nop			! Delay slot for call instruction

thirdInner:
	sub	%i0, %l0, %l2 	! subtract width from row, and save into OUTER
				! border registar
	mov	%l2, %o0	! move value of OUTER border to output registar
	mov	OFFSET, %o1	! move 2 to second output registar
	call	.div		! divide first output registar from second
	nop			! Delay slot for call instruction

	mov	%o0,%l2		! set divided value into outer
	cmp	%l2, 1		! compare outer value to one
	bl	exit		! if less than exit out
	nop			! Delay slot for call instruction
	
thirdInnerLoop:
	mov	%i2, %o0	! move outerCh to output registar 
	call	printChar	! call printChar on output registar
	nop			! Delay slot for call instruction

	sub	%l2, 1, %l2 	! decrement outer
	cmp	%l2, 1		! compare outer and one
	bge	thirdInnerLoop	! if greater or equal to repeat loop
	nop			! Delay slot for call instruction
	
	
end_loop_again:
	mov	NL, %o0		! set newline in output registar
	call	printChar	! call printChar on output registar
	nop			! Delay slot for call instruction

topHalfEnd:
	add	%l0,OFFSET,%l0 	! increment by 2
	cmp	%l0, %l5	! compare row and (height-2)
	ble	firstInner	! if less or equal to repeat loops
	nop			! Delay slot for call instruction


bottomHalf:
	mov	%i1, %l0	! set height value to row
	cmp	%l0, 0		! compare row to 0
	bl	exit		! if less than exit out
	nop			! Delay slot for call instruction

firstBottomInner:
	sub	%i0, %l0, %l2 	! subtract width from row, and save into OUTER
				! border registar
	mov	%l2, %o0	! move value of OUTER border to output registar
	mov	OFFSET, %o1	! move 2 to second output registar
	call	.div		! divide first output registar from second
	nop			! Delay slot for call instruction

	mov	%o0,%l2		! set divided value into outer
	cmp	%l2, 1		! compare outer value to one
	bl	exit		! if less than exit out
	nop			! Delay slot for call instruction
	
firstBottomLoop:
	mov	%i2, %o0	! move outerCh to output registar 
	call	printChar	! call printChar on output registar
	nop			! Delay slot for call instruction

	sub	%l2, 1, %l2 	! decrement outer
	cmp	%l2, 1		! compare outer and one
	bge	firstBottomLoop	! if greater or equal to repeat loop
	nop			! Delay slot for call instruction
	
secondBottomInner:
	mov 	1, %l3		! set inner to one	
	cmp 	%l3, %l0	! compare inner and row
	bg	exit		! if greater than exit out
	nop			! Delay slot for call instruction

secondBottomLoop:
	mov	%i3, %o0	! move inner to output registar
	call	printChar	! call printChar on output registar
	nop			! Delay slot for call instruction

	add	%l3, 1, %l3 	! increment inner
	cmp 	%l3, %l0	! compare inner and row
	ble	secondBottomLoop! if less or equal to repeat loop
	nop			! Delay slot for call instruction

thirdBottomInner:
	sub	%i0, %l0, %l2 	! subtract width from row, and save into OUTER
				! border registar
	mov	%l2, %o0	! move value of OUTER border to output registar
	mov	OFFSET, %o1	! move 2 to second output registar
	call	.div		! divide first output registar from second
	nop			! Delay slot for call instruction

	mov	%o0,%l2		! set divided value into outer
	cmp	%l2, 1		! compare outer value to one
	bl	exit		! if less than exit out
	nop			! Delay slot for call instruction
	
thirdBottomLoop:
	mov	%i2, %o0	! move outerCh to output registar 
	call	printChar	! call printChar on output registar
	nop			! Delay slot for call instruction

	sub	%l2, 1, %l2 	! decrement outer
	cmp	%l2, 1		! compare outer and one
	bge	thirdBottomLoop	! if greater or equal to repeat loop
	nop			! Delay slot for call instruction
	

end_loop_Bottom:
	mov	NL, %o0		! set newline in output registar
	call	printChar	! call printChar on output registar
	nop			! Delay slot for call instruction

bottomHalfEnd:
	sub	%l0,OFFSET,%l0 	! decrement by 2
	cmp	%l0, 0		! compare row and 0
	bge	firstBottomInner! if greater than or equal to to repeat loops
	nop			! Delay slot for call instruction
	

bottomRow:
	mov	1, %l1		! set column to one
	cmp	%l1, %i0	! compare column and width
	bg	exit		! if greater than exit out
	nop			! Delay slot for call instruction
	
bottomRowLoop:
	mov	%i2, %o0	! move outerCh to output registar
	call	printChar	! call printChar on output registar
	nop			! Delay slot for call instruction

	inc	%l1		! increment column
	cmp	%l1, %i0	! compare column with width
	ble	bottomRowLoop 	! if less than or equal to repeat loop
	nop			! Delay slot for call instruction

bottom_end_loop:
	mov	NL, %o0		! send newline to output registar
	call	printChar	! call printchar on output registar
	nop			! Delay slot for call instruction

exit:
	ret			! return from subroutine
	restore			! restore caller's window

