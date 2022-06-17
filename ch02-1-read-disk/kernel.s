.code16

.text

.equ DEMOSEG, $0x1020
.equ LEN, 22


show_text:
  # put address of string to ES:BP   
  mov $DEMOSEG, %AX
  mov %AX, %ES
  mov $0x03, %AH
  mov %BH, %ES
  int $0x10

  mov $msg, %BP
  mov $0x1301, %ax
  mov $0x000a, %bx   # green 
  mov $LEN, %CX      # char count

  int $0x10

loop_forever:
  jmp loop_forever
msg:
  .byte 13, 10
  .ascii "kernel is running."
  .byte 13, 10