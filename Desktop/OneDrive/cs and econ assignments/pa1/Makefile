#
# Makefile template for CSE 30 -- PA1
#

#
# You need to change these next lines for each assignment
#

HEADERS		= pa1.h strings.h

C_SRCS		= main.c strToLong.c

ASM_SRCS	= isOdd.s printChar.s checkRange.s displayDiamond.s

C_OBJS		= main.o strToLong.o

ASM_OBJS	= isOdd.o printChar.o checkRange.o displayDiamond.o

OBJS		= ${C_OBJS} ${ASM_OBJS}

EXE		= pa1

#
# You should not need to change anything below this line
#

#
# Relevant man pages:
#
# man gcc
# man as
# man lint
#

GCC		= gcc
ASM		= $(GCC)
LINT		= lint

GCC_FLAGS	= -c -g -std=c99 -pedantic -Wall -D__EXTENSIONS__
LINT_FLAGS1	= -c -err=warn
LINT_FLAGS2	= -u -err=warn
ASM_FLAGS	= -c -g
LD_FLAGS	= -g -Wall

#
# Standard rules
#

.s.o:
	@echo "Assembling each assembly source file separately ..."
	$(ASM) $(ASM_FLAGS) $<
	@echo ""

.c.o:
	@echo "Linting each C source file separately ..."
	$(LINT) $(LINT_FLAGS1) $<
	@echo ""
	@echo "Compiling each C source file separately ..."
	$(GCC) $(GCC_FLAGS) $<
	@echo ""

#
# Simply have our project target be a single default $(EXE) executable.
#

$(EXE):	$(OBJS)
	@echo "2nd phase lint on all C source files ..."
	$(LINT) $(LINT_FLAGS2) *.ln
	@echo ""
	@echo "Linking all object modules ..."
	$(GCC) $(LD_FLAGS) -o ${EXE} $(OBJS)
	@echo ""
	@echo "Done."

${C_OBJS}:      ${HEADERS}


clean:
	@echo "Cleaning up project directory ..."
	/usr/bin/rm -f *.o $(EXE) *.ln core a.out \
		unitTest_checkRange unitTest_isOdd unitTest_strToLong
	@echo ""
	@echo "Clean."

unitTest_checkRange: test.h pa1.h checkRange.s unitTest_checkRange.c
	@echo "Compiling unitTest_checkRange.c"
	gcc -g -o unitTest_checkRange unitTest_checkRange.c checkRange.s
	@echo "Done."

run_unitTest_checkRange: unitTest_checkRange
	@echo "Running unitTest_checkRange"
	@./unitTest_checkRange

unitTest_isOdd: test.h pa1.h isOdd.s unitTest_isOdd.c
	@echo "Compiling unitTest_isOdd.c"
	gcc -g -o unitTest_isOdd unitTest_isOdd.c isOdd.s
	@echo "Done."

run_unitTest_isOdd: unitTest_isOdd
	@echo "Running unitTest_isOdd"
	@./unitTest_isOdd

unitTest_strToLong: test.h pa1.h strToLong.c unitTest_strToLong.c
	@echo "Compiling unitTest_strToLong.c"
	gcc -g -o unitTest_strToLong unitTest_strToLong.c strToLong.c
	@echo "Done."

run_unitTest_strToLong: unitTest_strToLong
	@echo "Running unitTest_strToLong"
	@./unitTest_strToLong

new:
	make clean
	make

