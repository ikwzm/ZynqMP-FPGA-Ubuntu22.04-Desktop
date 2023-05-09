## Build Ubuntu 22.04(Desktop) RootFS

### Prepare to build Ubuntu 22.04 Desktop RootFS

#### Install Ubuntu 22.04(Console) to Ultra96/Ultra96-V2/Kv260/Kr260

 * [Ultra96](https://github.com/ikwzm/ZynqMP-FPGA-Ubuntu22.04-Console/blob/v1.1.2/doc/install/ultra96-console.md)
 * [Ultra96-V2](https://github.com/ikwzm/ZynqMP-FPGA-Ubuntu22.04-Console/blob/v1.1.2/doc/install/ultra96v2-console.md)
 * [Kv260](https://github.com/ikwzm/ZynqMP-FPGA-Ubuntu22.04-Console/blob/v1.1.2/doc/install/kv260-console.md)
 * [Kr260](https://github.com/ikwzm/ZynqMP-FPGA-Ubuntu22.04-Console/blob/v1.1.2/doc/install/kr260-console.md)

#### Setup Ultra96/Ultra96-V2/Kv260/Kr260 borad

 * Put the SD-Card in the slot on Ultra96/Ultra96-V2/Kv260/Kr260.
 * Plug in your Display Port monitor into the Ultra96 using the mini Display Port connector.
 * Plug in a USB mouse and USB keyboard into the USB ports of the Ultra96.

#### Starting Ultra96/Ultra96-V2/Kv260 board

 * Turn on the Ultra96/Ultra96-V2/Kv260/Kr260.
 * After a few seconds, the Ubuntu login screen will appear on the display.
 * The password for administrator rights is "admin".
   
#### Download ZynqMP-FPGA-Ubuntu22.04-Console

```console
shell$ wget https://github.com/ikwzm/ZynqMP-FPGA-Ubuntu22.04-Console/archive/refs/tags/v1.1.2.tar.gz
shell$ tar xfz v1.1.2.tar.gz
```

#### Prepare 

```console
shell# export targetdir=ubuntu22.04-desktop-rootfs
shell# export distro=jammy
shell# mkdir $PWD/$targetdir
shell# (cat ZynqMP-FPGA-Ubuntu22.04-Console-1.1.2/ubuntu22.04-console-rootfs.tgz.files/*) | tar xfz - -C $PWD/$targetdir
shell# cp debian/*.deb    $PWD/$targetdir/home/fpga/debian
shell# cp files/xorg.conf $PWD/$targetdir/home/fpga/debian
shell# cp scripts/upgrade-ubuntu22.04-desktop.sh $PWD/$targetdir
shell# mount -vt proc proc                       $PWD/$targetdir/proc
shell# mount -vt devpts devpts -o gid=5,mode=620 $PWD/$targetdir/dev/pts
```

### Build ubuntu22.04-desktop-rootfs

#### Change Root to ubuntu22.04-desktop-rootfs

```console
shell$ sudo chroot $PWD/$targetdir
```

There are two ways

1. run upgrade-ubuntu22.04-desktop.sh (easy)
2. run this chapter step-by-step (annoying)

#### Setup APT

````console
root@ubuntu-fpga:/# export distro=jammy
root@ubuntu-fpga:/# export LANG=C
root@ubuntu-fpga:/# apt update
````
#### Install Ubuntu Desktop

```console
root@ubuntu-fpga:/# apt install -y ubuntu-desktop
```

#### Install ZynqMP-FPGA-Xserver

```console
root@ubuntu-fpga:/# dpkg -i /home/fpga/debian/xserver-xorg-video-armsoc-xilinx_1.5-trial-13_arm64.deb
root@ubuntu-fpga:/# cp      /home/fpga/debian/xorg.conf /etc/X11
```

#### Install libgl1-mesa for Lima

```console
root@ubuntu-fpga:/# dpkg -i /home/fpga/debian/libgl1-mesa-xlnx-dri_22.2.5-0ubuntu0.1~22.04.1_arm64.deb
```

#### Setup DRM Lima Driver

```console
root@ubuntu-fpga:/# echo "lima" > /etc/modules-load.d/lima.conf
root@ubuntu-fpga:/# echo "options lima of_400_id=arm,mali-400" > /etc/modprobe.d/lima.conf
```

#### Change Display Manager gdm -> lightdm

Please choose "lightdm" instead of "gdm"

```console
root@ubuntu-fpga:/# apt install -y libpam-gnome-keyring libpam-kwallet5
root@ubuntu-fpga:/# apt install -y lightdm lightdm-settings slick-greeter
```

#### Clean Cache

```console
root@ubuntu-fpga:/# apt-get clean
```

#### Create Debian Package List

```console
root@ubuntu-fpga:/# dpkg -l > dpkg-desktop-list.txt
```

#### Finish

```console
root@ubuntu-fpga:/# exit
shell# rm -f  $PWD/$targetdir/upgrade-ubuntu22.04-desktop.sh
shell# mv     $PWD/$targetdir/dpkg-desktop-list.txt files/ubuntu22.04-desktop-dpkg-list.txt
shell# umount $PWD/$targetdir/proc
shell# umount $PWD/$targetdir/dev/pts
```

### Build ubuntu22.04-desktop-rootfs.tgz

```console
shell# cd $PWD/$targetdir
shell# tar cfz ../ubuntu22.04-desktop-rootfs.tgz *
shell# cd ..
```

### Build ubuntu22.04-desktop-rootfs.tgz.files

```console
shell# mkdir ubuntu22.04-desktop-rootfs.tgz.files
shell# cd    ubuntu22.04-desktop-rootfs.tgz.files
shell# split -d --bytes=40M ../ubuntu22.04-desktop-rootfs.tgz
shell# cd ..
```