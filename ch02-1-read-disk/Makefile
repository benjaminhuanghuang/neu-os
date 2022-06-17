all: Image

.PHONY=clean run-qemu

run-qemu:
	@qemu-system-i386 -boot a -fda bootsect -nographic

bootsect.o: 
	as --32 bootsect.s  -o bootsect.o

bootsect: bootsect.o ld-bootsect.ld
	ld -T ld-bootsect.ld bootsect.o -o bootsect
	objcopy -O binary -j .text bootsect       

kernel: kernel.o

Image: bootsect kernel
	dd if=bootsect of= Image bs=512 count=1
	dd if=demo of=Image bs=512 count=4 seek=1
	echo "Image created"

clean: 
	rm -f *.o bootsect 


   
 