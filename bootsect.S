.code16

.global _bootstart

.equ BOOTSEG, 0x07c0

ljmp $BOOTSEG, $_bootstart

_bootstart:
	mov $0x03, %ah
	int $0x10
	
	mov $BOOTSEG, %ax
	mov %ax, %ds
	movw $0x7c0, %ax
	movw %ax, %es
	movw $mstr, %bp
	mov len, %cx
	mov $0x1301, %ax
	movw $0x00cf, %bx
	int $0x10
_loop:
	mov len, %ax
	jmp _loop
mstr:
	.ascii "Hello world dhysmq, this is My First OS!"
len:
	.int . - mstr
.= 510

signature:
	.word 0xaa55
 
