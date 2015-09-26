/*
 * Filename: nops.s
 * Author: Sanskriti Mehta
 * Userid: cs30xkt
 * Date: 04/21/201i4
 * Description: shows number of integers needed to calculate secret numbers
 *              
 */
	.section	".rodata"
strfmt:
	.asciz  "%4d: %d\n"


	.global nops
	.section	".text"
nops:
	save	%sp, -96, %sp

	mov	%i0, %l0	! num
	clr	%l1		! sum
	mov	%l1, %l2	! i

	cmp %l2, %l0
	bge,a endloop
	mov %l1, %i0

startloop:

	call	isOdd
	mov %l2, %o0

	cmp %o0, %g0
	be,a  isOddElse
	mov %l1, %o0

	ba isOddEnd
	add %l1, %l2, %l1

isOddElse:

	mov %l1, %o0
	call	.mul
	mov %l2, %o1

	mov %o0, %l1
	sra %l1, 1, %l1

isOddEnd:

	set strfmt, %o0
	mov %l2, %o1
	call printf
	mov %l1, %o2

	add %l2, 1, %l2

	cmp %l2, %l0
	bl  startloop
	nop

endloop:

	mov %l1, %i0

	ret
	restore

