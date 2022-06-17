
## ELF to bin
直接使用
```
@as --32 bootsetc.s  -o bootsect
```
会生成 ELF文件，文件中会包含ELF相关信息，文件size超出512 Bytes. 
而BIOS需要的是纯粹的汇编代码汇编后的二进制内容

因此需要使用objcopy 进行提取 
```
  objcopy -O binary bootsect.o
```

执行
```
file bootsect.o
```
会显示bootsect.o是一个DOS/MBR boot sector


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
gcc 链接器生成的起始地址是0x0530
bootsector 的.txt section 的起始地址需要是0x0000

检查结果
```
  # display section headers
  objdump --section-headers bootsect


  # display sections
  objdump -s bootsect
```