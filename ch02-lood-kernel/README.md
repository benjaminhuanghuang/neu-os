# 从零开始编写操作系统 第 0x02 课 从实模式到保护模式

https://www.bilibili.com/video/BV1qx411p7yQ

https://www.bilibili.com/video/BV1qx411p7yQ?p=2

## Create the boot disk 

flappy的第一个扇区(512 Bytes)是bootsect， 第二个扇区是kernel

使用 dd 命令把 二进制文件写入 flappy disk
```
  dd if=bootsect of=Image bs=512 count=1
	
  dd if=kernel of=Image bs=512 count=4 seek=1   
  # seek=1: 避免覆盖第一个section
```

check bootsect size
```
  du -b bootsect
```


BIOS在启动时把`bootsect`加载到内存`0x7C00`处并执行, `bootsect` 会把kernal加载到内存`0x10200`，并jump 到`0x10200`开始执行


