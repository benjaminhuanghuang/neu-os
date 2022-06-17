.code 16

.text { color:}

.equ DEMOSEG, $0x1020
.equ LEN, 8


show_text:
  # put address of string to ES:BP   
  mov $DEMOSEG, %AX
  mov %AX, %ES
  mov $msg, %BP
  mov $0x1301, %ax
  mov $0x0007, %bx   # white 
  mov $LEN, %CX      # char count
  int $0x10

msg:
  .byte 13, 10
  .ascii "kernel is running."
  .byte 13, 10