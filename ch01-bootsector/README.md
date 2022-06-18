# 从零开始编写操作系统 第 0x01 课

https://www.bilibili.com/video/BV1Lx411i75U


## Bootstrapping
- BIOS
  - Memory mapping
  - Power on Self test
  - Find MBR Sector

- CPU Register init

- MBR Sector (loaded at 0x7c0)
  - Load system to RAM
  - initialization: GDT, IDT, Interrupt
  - Jump to real-mode system code

## Linux Bootloader
- GRUA
- LILO
- SysLinux  


## Link Script
```
OUTPUT_FORMAT(elf32-i386)
OUTPUT_ARCH(i386)

SECTIONS {
  # .text start from 0x0000
  .text 0x00000: {
    *(.text)
  } 
}

```