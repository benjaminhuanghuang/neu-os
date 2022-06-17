
.code16

# export function name for the linker
.global _bootstart

# 16-real mode address = SEG<<4 + OFFEST
.equ BOOTSEG, $0x07c0

ljump $BOOTSEG, $_bootstart

_bootstart:
  jmp _bootstart


# fill 0s to address 510
.= 510
signature:
  .word 0xaa55   # little endian



