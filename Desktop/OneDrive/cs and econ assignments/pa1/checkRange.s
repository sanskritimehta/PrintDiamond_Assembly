/* 
 * FileName: checkRange.s
 * Author: Sanskriti Mehta 
 * Userid: cs30xkt
 * Description: SPARC assembly routine which checks if the value chosen 
 *              is within a certain range.
 *              Called from main()
 * Date: April 13, 2014
 * Sources of Help: Class notes, discussion section, tutors for this class
 *
 */

        .global checkRange ! Declares the symbol to be globaly visible so
                           ! we can call this function from other modules.

        .section ".text"   ! The text segment begins here

/*
 * Function name: checkRange()
 * Function protype: int checkRange(long value, long minRange, long maxRange);
 * Description: checks that value is within range of minRange, and maxRange,
 *              returns false otherwise.
 * Parameters:
 *      arg 1: long value -- value that is compared to minRange and maxRange
 *      arg 2: long minRange -- minimum value of range
 *      arg 3: long maxRange -- maximum value of range
 *
 * Side Effects: None.
 * Error Conditions: If not in range, error message is displayed through main
 * Return Value: 1 if value is in range, else 0
 *
 * Registers Used:
 *     %i0 - arg1 -- value to be checked if within range or not
 *     %i1 - arg2 -- minimum range value
 *     %i2 - arg3 -- maximum range value
 */

checkRange:
	save	%sp, -96, %sp	! save callers window

	cmp	%i0, %i2  	! compare value and max value 
	bg	out_range	! if value> max value, then out of range
	nop

	cmp	%i0, %i1	! compares value and min value
	bl	out_range	! if value< min value, then out of range
	nop

	mov 	1, %i0		! true returned when in-range
	ret			! return from subroutine
	restore			! Restore caller's window; in "ret" delay slot

out_range:
	mov 	0, %i0 		! return false when out of range
	ret			! return from subroutine
	restore			! restore caller's window
