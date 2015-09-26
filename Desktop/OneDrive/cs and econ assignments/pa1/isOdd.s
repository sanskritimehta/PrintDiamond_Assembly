/* 
 * FileName: isOdd.s
 * Author: Sanskriti Mehta 
 * Userid: cs30xkt
 * Description: Example SPARC assembly routine to check if value is 
 *              odd or not, return 1 if true, else return 0.
 *              Called from main()
 * Date: April 13, 2014
 * Sources of Help: lecture and discussion notes
 *
 */

        .global isOdd     ! Declares they sumbol to be globally visible so
                          ! we can call this function from other modules.
 
        .section ".text"  ! The text segment begins here

/*
 * Function name: isOdd()
 * Function protype: int isOdd(long num);
 * Description: returns true if num os odd, else returns 0
 * Parameters:
 *      arg 1: long num -- value that is checked to be odd or even
 *
 * Side Effects: None.
 * Error Conditions: None
 * Return Value: 1 if num is odd, else 0
 *
 * Registers Used:
 *      %io - arg 1 -- 1st number to check if odd or not
 *
 *	%o0 - output registar for arg1 value                      
 *      %o1 - output registar to save modded/ divided value
 */

isOdd:
	save	%sp, -96, %sp	! save callers window

	mov	%i0, %o0	! value goes into output registar
	mov	2, %o1		! 2 saved in second output registar
	call	.rem		! output registers are divided/modded
	nop
	
	mov 	%o0, %i0	! returned value is saved as current value
				
	ret			! value in arg1 is returned
	restore			! restore callers window


