#include <stdio.h>

#include "pa1.h"
#include "test.h"

void testisOdd( ) {

  int res;

  res = isOdd(51);
  TEST( res != 0 );

  res = isOdd(1492);
  TEST( res == 0 );

  res = isOdd(-1781);
  TEST( res != 0 );

  res = isOdd(-500);
  TEST( res == 0 );

  res = isOdd(0);
  TEST( res == 0 );

}


int main( void ) {

  fprintf(stderr, "Running tests for isOdd...\n");
  testisOdd();
  fprintf(stderr, "Done running tests!\n");

  return 0;
}
