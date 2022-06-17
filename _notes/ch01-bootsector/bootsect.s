
.code16

# export function name for the linker
.global _bootstart

# 16-real mode address = SEG<<4 + OFFEST
.equ BOOTSEG, $0x07c0

.text

ljump $BOOTSEG, $_bootstart

_bootstart:
#Get cursor position
  mov $0x03, %AH  
  int $0x10
    
 # put address of string to ES:BP   
  mov $BOOTSEG, %AX
  mov %AX. %ES
  mov $_string, %BP
  mov $0x1301, %AX
  mov $0x0007, %BX   # white
  mov $12, %CX        # char count
  int 0x10
   

loop:
  jmp loop


_string:
  .ascii "Hello..."
  .byte 13, 10, 13, 10    # new line

# fill 0s to address 510
.= 510
signature:
  .word 0xaa55   # little endian



