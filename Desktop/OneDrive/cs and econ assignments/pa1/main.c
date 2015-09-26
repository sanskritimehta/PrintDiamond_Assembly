/*
 * Filename: main.c
 * Author: Sanskriti Mehta 
 * Userid:cs30xkt
 * Description: This is the main file as it calls on all the functions and
 *              provides error messages when needed. It uses ASCII values to
 *              create the symbols and then the height and width for size of 
 *              the diamond. There are five arguments and each have to  fit
 *              specific rules, if not error messages are printed. 
 * Date: April 5, 2014 
 * Sources of Help: Online UNIX tutorial, class notes, tutors in class 
 *
 */

#include <stdio.h>
#include <stdlib.h>
#include "pa1.h"
#include <errno.h>
#include "strings.h"

/*
 * Function Name: main()
 * Function prototype: int main( int argc, char *argv[] );
 * Description: argv[0] is program name, argv[1] is width, argv[2] is height, 
 *              argv[3] is ASCII of border, and argv[4] is ASCII of diamond
 *              symbol. Put all of these together the program creates a 
 *              diamond of this size and symbols.
 * Parameters: 
 *              int argc - number of arguments
 *              char *argv[] - the specific arguments in array
 * Side Effects: Creates diamond of specfic symbols height and width. 
 * Error Conditions: A number of errors can be caused, and the compiler
 *                   just prints them out, but does not stop execution.
 *                   Further information of the type of errors will be 
 *                   provided in the commenting of code.
 * Return Value: returns initError which is 0 at the time. 
 */

int main( int argc, char *argv[])
{
  int initError =1; /* 0 errors to start with*/
  char err[BUFSIZ]; /*error message*/
  char a[] = "toothpaste";
  char *p = a;

  printf("%c", *p++);
  
  if(argc != 5)  /*if there arent 5 arguments there's an error*/
  {
    (void)fprintf(stderr, STR_USAGE, argv[0], WIDTH_MIN, WIDTH_MAX, HEIGHT_MIN,
           HEIGHT_MAX, ASCII_MIN, ASCII_MAX, ASCII_MIN, ASCII_MAX); 
    return 0; /*return 0 since there is an error*/
  }

  long width = strToLong(argv[1], BASE); /*set width to its long value*/

  if( errno == ERANGE) /*if long is too long*/ 
  {
     (void)snprintf(err, BUFSIZ, STR_ERR_STRTOLONG_CONVERTING, argv[1], BASE);
     perror(err);
  }
  else if (errno == PTR_ERROR) /* if not an integer*/
  {
      (void)fprintf(stderr, STR_ERR_STRTOLONG_NOTINT, argv[1]);
  }
  else if(errno==0)  
  {
    int range = checkRange(width, WIDTH_MIN, WIDTH_MAX); /*check if in range*/
    int odd = isOdd(width); /*width must be odd so check*/

    if (!range) /*if out of range print error statment*/ 
    {
      (void)fprintf(stderr, STR_ERR_WIDTH_RANGE, width, WIDTH_MIN, WIDTH_MAX);
      initError =0;
    }
    if (!odd) /*if odd print error statement*/ 
    {
      (void)fprintf(stderr, STR_ERR_WIDTH_ODD, width);
      initError = 0;
    }
  }
  else
    initError = 0;


  long height = strToLong(argv[2], BASE); /*set height to its long value*/
  if( errno == ERANGE) /*if long is too long*/ 
  {
     (void)snprintf(err, BUFSIZ, STR_ERR_STRTOLONG_CONVERTING, argv[2], BASE);
     perror(err);
  }
  else if (errno == PTR_ERROR) /* if not an integer*/
  {
      (void)fprintf(stderr, STR_ERR_STRTOLONG_NOTINT, argv[2]);
  }
  else if(errno==0)
  {
    int range = checkRange(height, HEIGHT_MIN, HEIGHT_MAX); /*check if in
    range*/
    int odd = isOdd(height); /*check if odd*/
  
    if (!range) /*if out of range print error message*/
    {
      (void)fprintf(stderr,STR_ERR_HEIGHT_RANGE, height, HEIGHT_MIN, HEIGHT_MAX);
      initError = 0;
    }
    if (!odd) /*if odd print error message*/
    { 
      (void)fprintf(stderr, STR_ERR_HEIGHT_ODD, height);
      initError = 0;
    }
    if( height >= width) /*if height is greater than width print error mesage*/
    {
      (void)fprintf(stderr, STR_ERR_HEIGHT_LESSTHAN_WIDTH, height, width);
      initError =0;
    }
  }
  else
    initError = 0;

  long borderCh = strToLong(argv[3], BASE); /*get ASCII value*/
  if( errno == ERANGE) /*if long is too long*/ 
  {
     (void)snprintf(err, BUFSIZ, STR_ERR_STRTOLONG_CONVERTING, argv[3], BASE);
     perror(err);
  }
  else if (errno == PTR_ERROR) /* if not an integer*/
  {
      (void)fprintf(stderr, STR_ERR_STRTOLONG_NOTINT, argv[3]);
  }
  else if(errno==0)
  {
    int range = checkRange(borderCh, ASCII_MIN, ASCII_MAX); /*check range*/
  
    if (!range) /*if not in range print error message*/
    {
      (void)fprintf(stderr,STR_ERR_BORDER_RANGE, borderCh, ASCII_MIN, ASCII_MAX);
      initError = 0;
    }
  }
  else
    initError = 0;

 
  long diamondCh = strToLong(argv[4], BASE); /*get ASCII for diamond symbol*/
  if( errno == ERANGE) /*if long is too long*/ 
  {
     (void)snprintf(err, BUFSIZ, STR_ERR_STRTOLONG_CONVERTING, argv[4], BASE);
     perror(err);
  }
  else if (errno == PTR_ERROR) // if not an integer
  {
      (void)fprintf(stderr, STR_ERR_STRTOLONG_NOTINT, argv[4]);
  }
  else if(errno==0)
  {
    int range = checkRange(diamondCh, ASCII_MIN, ASCII_MAX); /*check range*/
  
    if (!range) /*if not in range print error message*/
    {
      (void)fprintf(stderr,STR_ERR_DIAMOND_RANGE, diamondCh, ASCII_MIN, ASCII_MAX);
      initError = 0;
    }
    if( diamondCh == borderCh) /*if symbols for diamondCh and borderCh are same
        print error message*/
    {
      (void)fprintf(stderr, STR_ERR_BORDER_DIAMOND_DIFF, borderCh, diamondCh);
    }
  }
  else
    initError = 0;


  if(initError==1) /*if no errors than display the diamond*/
  {
    displayDiamond(width, height, borderCh, diamondCh);
  }
  else
  (void)fprintf(stdout, "\n");
  
  return initError;  /*returns 0*/
}
