/* 
 * FileName: strToLong.c
 * Author: Sanskriti Mehta 
 * Userid: cs30xkt
 * Description: SPARC assembly routine which checks cases of whether
 *              the string is a long, and makes the long to be displayed
 *              in the base provided. If string is too long, or is not 
 *              of type long error messages are displayed
 *              Called from main()
 * Date: April 13, 2014
 * Sources of Help: Class notes, discussion section
 *
 */

#include "pa1.h"
#include <stdlib.h>
#include <stdio.h>
#include <errno.h>
#include "strings.h"

 /*
 * Function name: strToLong()
 * Function protype: int strToLong(char *str, int base);
 * Description: makes the string provided into a long according to the base
 *              provided in the second parameter.
 *              
 * Parameters:
 *      char *str - string to be converted into long
 *      int base - base which this string is converted into
 *
 * Side Effects: None.
 * Error Conditions: string might be too long, or it may not be all ints,
 *                   for both cases there are separate error messages
 * Return Value: value that has been converted
 *
 * Registers Used: N/A
 */


long strToLong( char *str, int base )
{
  char *endptr;     /*str to be converted*/
  long num =0;      /*value to be returned*/
  errno = 0;        /*comes from errno.h*/

  num = strtol (str, &endptr, base);   /* may set errno */

  if( errno != 0) /*when string is too long*/
  {
     errno =ERANGE; /*number is out of range*/
     return 1;   
  }


  if (*endptr != '\0') /*when string is not numerical*/
  {
      errno = PTR_ERROR;
      return 1;
  }
  
  return num; /*return final value which has been converted*/
}
