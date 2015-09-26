.global displayDiamond
.section ".text"
fmt: .asciz "0x%08X\n"
c: 	.byte 0xDD
	.align 2
	
s:      .half   0xCAFE
	.align 4
	
i1:     .word   0x12345678
i2:     .word   0x12345678     
i3: 	.word   0x12345678      
i4: 	.word   0xAAAA0000
	.section ".text"

displayDiamond:
	save 	%sp, -96, %sp
	
	set	x, %l0
	set 	s, %l1
	lduh	 [%l1], %l2

	stb 	%l2, [%l0 +1]

	srl 	%l2, 8 , %l2
	stb	%l2, [10+2]

	set	fmt, %o0
	ld 	[%l0], %o1
	call	printf
	nop

	set 	i1, %l0
	set	c, %l1
	ldub	[%l1], %l2

	sth	%l2, [%l0+2]
	stb	%l2, [%l0+1]

	set	i2, %l0
	set	i3, %l1
	ld	[%l1], %l2

	sth 	%l2, [%l0]

	sra	%l2, 8, %l2
	sth	%l2, [%l0]

	set	fmt, %o0
	ld	[%l0], %o1
	call	printf
	nop

	ret
	restore
