
.code16

# export function name for the linker
.global _bootstart

# 16-real mode address = SEG<<4 + OFFEST
.equ BOOTSEG, 0x07c0
# save the value of the settings
.equ INITSEG, 0x900
# load kernel to here
.equ DEMOSEG, 0x1000


.text

ljmp $BOOTSEG, $_bootstart

_bootstart:
#Get cursor position
  mov $0x03, %AH  
  int $0x10
    
# put address of string to ES:BP   
  mov $BOOTSEG, %AX
  mov %AX, %ES
  mov $_string, %BP
  mov $0x1301, %AX
  mov $0x0007, %BX   # white
  mov $12, %CX        # char count
  int $0x10
   

_load_demo:
  mov $0x0000, %DX    # header :DH, deriver A is 0: DL
  mov $0x0002, %CX    # read section 2
  mov $DEMOSEG, %AX  # set EX to address of buffer
  mov %ax, %ex
  mov $$0x0200, %bx
  mov %0x02, %ah
  mov $4, %al           # read 4 section from the disk
  int $0x13
  jnc demo_load_ok      # check CF
  jmp _load_demo

demo_load_ok:
  mov $DEMOSEG, %AX
  mov %ax, %ds
  ljmp $  0x1020
 



_string:
  .ascii "Hello..."
  .byte 13, 10, 13, 10    # new line

# fill 0s to address 510
.= 510
signature:
  .word 0xaa55   # little endian



