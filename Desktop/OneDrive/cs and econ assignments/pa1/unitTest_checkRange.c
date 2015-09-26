#include <stdio.h>

#include "pa1.h"
#include "test.h"

void testcheckRange( ) {

  int res;

  res = checkRange(11, 5, 20);
  TEST( res != 0 );

  res = checkRange(99, 5, 20);
  TEST( res == 0 );

  res = checkRange(3, 5, 20);
  TEST( res == 0 );

  res = checkRange(0, -10, 10);
  TEST( res != 0 );

  res = checkRange(17, 17, 17);
  TEST( res != 0 );

}


int main( void ) {

  fprintf(stderr, "Running tests for checkRange...\n");
  testcheckRange();
  fprintf(stderr, "Done running tests!\n");

  return 0;
}
