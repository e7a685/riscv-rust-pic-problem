	.section .bss
	.align 12
stack_bottom:
	.skip 4096
stack_top:

	
	.section .text.init
	.global _start
_start:
	la a0, _s_all
	la a1, _e_all

	// copy to other location
	mv t1, a0 // src
	li t2, 0x00100000 // 1MB offset
	add t2, t2, t1 // dest
1:	lw t0, (t1)
	sw t0, (t2)
	addi t1, t1, 4
	addi t2, t2, 4
	blt t1, a1, 1b
	
	// jump to new location
	la t0, new_loc
	li t1, 0x00100000
	add t0, t0, t1
	jr t0

new_loc:
	// replace old code with loops
	la t0, j_to_self
	lw t0, (t0)
	mv t1, a0
1:	sw t0, (t1)
	addi t1, t1, 4
	blt t1, a1, 1b

	// clear bss
	la t0, _sbss
	la t1, _ebss
1:	sw x0, (t1)
	addi t0, t0, 4
	blt t0, t1, 1b

	la sp, stack_top

	jal main

halt:	wfi
	j halt

j_to_self: j j_to_self
j_to_self2:	j j_to_self2
