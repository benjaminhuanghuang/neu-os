




## gcc
```
  gcc hello.c -o a.out
```
-s

-E

-c



## as
```
  as hello.s
```

## ld
```

```




## objcopy
提取编译后生成的二进制文件的某一部分(section), 去掉文件中的metadata
```
```


## objdump
```
  objdump -S hello.exe | less

  objdump -sym 


  # dump as 16-bit asm code
  objdump -m i8086 -S bootsect.o


  # show sections
  objdump -s demo

  # display section headers
  objdump --section-headers bootsect


```


## qemu (模拟器)
make run

```
  qemu-system-i386 -boot a -fda bootimg -serial stdio
```
-boot a: start from disk a
-fda bootimg: load bootimg as disk a
-serial stdio: use std IO as serial port


## bochs (模拟器)
config file: bochsrc
```
  floppya: 1_44="./bootimg", status-inserted
  boot: floppy
  display_library: x, options="gui_debug" 
```

start GUI 
```
  bochs -q
```