/*
 * Filename: printChar.s
 * Author: Sanskriti Mehta
 * Userid: cs30xkt
 * Description:Example SPARC assembly routine to print out characters
 *             one by one. This function prints out the border and 
 *             diamond symbols. 
 *             Called from displayDiamond()
 * Date: April 21st 2014
 * Sources of Help: class notes, lectures, printWelcome.s from pa0 
 *                  assignment which was given in class.
 */

     .global printChar       ! Declares the symbol to be globally visible so
                             ! we can call this function from other modules

     .section ".data"        ! The data segment begins here
fmt:                         ! Formatted string used for printf()
     .asciz  "%c"


     .section ".text"        ! The text segment begins here
/*
 * Function name: printChar()
 * Function prototype: void printChar( char ch );
 * Description: Prints to stdout the characters for the border and diamond.
 * Parameters:
 *    arg1: char *str -- the characters/ string to print
 *
 * Side Effects: Outputs the characters in the order given by user
 * Error Conditions: None. [Arg 1 is not checked to ensure it is no NULL.]
 * Return Value: None.
 *
 * Registers Used:
 *      %i0 - arg1 -- the string (char *) passed in to this function
 *
 *      %o0 - param 1 to printf() --format string
 *      %o1 - param 2 to printf() -- copy of arg 1 being passed in
 */

printChar:
      save   %sp, -96, %sp  ! Save caller's window; if different than -96
                            ! then comment on how that value was calculated.

      set    fmt, %o0       ! Format string
      mov    %i0, %o1       ! Copy of formal parameter to print
      call   printf         ! Make function call
      nop                   ! Delay slot for call instruction

      ret                   ! Return from subroutine
      restore               ! Restore caller's window; in "ret" delay slot

