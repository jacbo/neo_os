all: Image

.PHONY=clean

run-qemu:
	qemu-system-i386 -boot a -fda bootsect
bootsect.o:
	- as --32 bootsect.S -o bootsect.o
bootsect: bootsect.o ld-bootsect.ld
	ld -m elf_i386 -t ld-bootsect.ld bootsect.o -o bootsect
	objcopy -O binary bootsect
clean:
	- rm -f *.o
	rm -f bootsect
