all: Image

.PHONY=clean run-qemu

run-qemu:
	@qemu-system-i386 -boot a -fda bootsect.o

bootsect.o: 
	@as --32 bootsetc.s  -o bootsect

bootsect: bootsetc.o ld-bootest.ld
	- ld -T ld-bootest.ld bootsetc.o -o bootsect
	- objcopy -O binary -j .text bootsect       

clean: 
	@rm -f *.o


  
