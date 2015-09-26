/*
 * Filename: strings.h
 * Author: Sanskriti Mehta
 * Userid: cs30xkt
 * Description: Strings used in PA1 output
 * Date: 04/21/2014
 * Sources of Help: lecture and disscusion notes
 *              
 */

#ifndef STRINGS_H
#define STRINGS_H


#define STR_USAGE "\nUsage: %s width height border_ch diamond_ch\n"\
  "    width      (must be odd within the range of [%d - %d])\n"\
  "    height     (must be odd within the range of [%d - %d])\n"\
  "               (must be less than width)\n"\
  "    border_ch  (must be an ASCII value within the range [%d - %d])\n"\
  "               (must be different than diamond_ch)\n"\
  "    diamond_ch (must be an ASCII value within the range [%d - %d])\n"\
  "               (must be different than border_ch)\n\n"

#define STR_ERR_WIDTH_RANGE "\n\twidth(%ld) must be within the range"\
  " of [%d - %d]\n"

#define STR_ERR_WIDTH_ODD "\n\twidth(%ld) must be an odd number.\n"

#define STR_ERR_HEIGHT_RANGE "\n\theight(%ld) must be within the range"\
  " of [%d - %d]\n"

#define STR_ERR_HEIGHT_ODD "\n\theight(%ld) must be an odd number.\n"

#define STR_ERR_HEIGHT_LESSTHAN_WIDTH "\n\theight(%ld) must be less than"\
  " width(%ld)\n"

#define STR_ERR_BORDER_RANGE "\n\tborder_ch(%ld) must be an ASCII code"\
  " in the range [%d - %d]\n"

#define STR_ERR_DIAMOND_RANGE "\n\tdiamond_ch(%ld) must be an ASCII code in "\
  "the range [%d - %d]\n"

#define STR_ERR_BORDER_DIAMOND_DIFF "\n\tborder_ch(%ld) and diamond_ch(%ld)"\
  " must be different\n"

#define STR_ERR_STRTOLONG_CONVERTING "\n\tConverting \"%s\" base \"%d\""

#define STR_ERR_STRTOLONG_NOTINT "\n\t\"%s\" is not an integer\n"


#endif /* STRINGS_H */
