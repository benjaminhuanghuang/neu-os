

```
docker run --rm -it -v "$PWD":/mnt/workspace -w /mnt/workspace gcc bash

—rm            Automatically remove the container when it exits
--volume , -v  Bind mount a volume   $PWD is current folder
--workdir, -w Working directory inside the container

```


## Insall qemu
```
sudo apt update

apt install qemu-kvm
```
