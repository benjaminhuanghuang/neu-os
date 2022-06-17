
## ELF to bin
直接使用
```
@as --32 bootsetc.s  -o bootsect
```
会生成 ELF文件，文件中会包含ELF相关信息，BIOS需要的是纯粹的.s文件汇编后的结果

需要使用objcopy 进行提取 
```
  objcopy -O binary bootsect.o
```

提取.text 
```
  objcopy -O binary -j .text bootsect
```


## checkout put
```
objdump -m i8086 -S bootsect.o
```


Hex output
```
  hexdump -C bootsect.o
```

```
file bootsect.o
```
会显示bootsect.o是一个DOS/MBR boot sector



## Link script



检查结果
```
  # display section headers
  objdump --section-headers bootsect


  # display sections
  objdump -s bootsect
```