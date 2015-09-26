#include <stdio.h>
#include <errno.h>
#include <limits.h>

#include "pa1.h"
#include "test.h"

void teststrToLong( ) {

  int errors = 0;

  long num;
  char buf[BUFSIZ];

  errno = 0;
  num = strToLong("54321xyz", 10);
  TEST( errno == PTR_ERROR );

  errno = 0;
  num = strToLong("91827364501", 10);
  TEST( errno == ERANGE );

  num = strToLong("-183", 10);
  TEST( num == -183 );

  num = strToLong("17", 10);
  TEST( num == 17 );

  num = strToLong("0", 10);
  TEST( num == 0 );

  num = strToLong("", 10);
  TEST( num == 0 );

  snprintf(buf, BUFSIZ, "%d", LONG_MAX);
  num = strToLong(buf, 10);
  TEST( num == LONG_MAX );

  snprintf(buf, BUFSIZ, "%d", LONG_MIN);
  num = strToLong(buf, 10);
  TEST( num == LONG_MIN );

}


int main( void ) {

  fprintf(stderr, "Running tests for strToLong...\n");
  teststrToLong();
  fprintf(stderr, "Done running tests!\n");

  return 0;
}
