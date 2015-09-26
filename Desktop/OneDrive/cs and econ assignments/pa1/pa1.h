/*
 * Filename: pa1.h
 * Author: Sanskriti Mehta
 * Userid: cs30xkt
 * Date: 04/21/201i4
 * Description: defines constant values, and function prototypes
 *              for this program to work. 
 */

#ifndef PA1_H
#define PA1_H

#define BASE 10
#define WIDTH_MIN 3
#define WIDTH_MAX 21
#define HEIGHT_MIN 1
#define HEIGHT_MAX 19
/* See "man ascii" for ASCII char values */
#define ASCII_MIN 33/* '!' */
#define ASCII_MAX 126   /* '~' */
#define PTR_ERROR -1

/* Local function prototypes for PA1 (written in Assembly or C) */
long strToLong( char* str, int base );
int checkRange( long value, long minRange, long maxRange );
void displayDiamond( long width, long height, long borderCh, long diamondCh );
int isOdd( long value );

/*
 * void printChar( char ch );
 *
 * Only called from an Assembly routine. Not needed in any C routine.
 * Would get a lint message about function declared but not used.
 */

#endif /* PA1_H */

