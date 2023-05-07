## Install Ubuntu 22.04(Desktop) to Kr260

### Downlowd from github

**Note: Downloading the entire repository is time consuming, so download only the branch you need.**

```console
shell$ wget https://github.com/ikwzm/ZynqMP-FPGA-Ubuntu22.04-Desktop/archive/refs/tags/v1.1.0.tar.gz
shell$ tar xfz v1.1.0.tar.gz
shell$ cd ZynqMP-FPGA-Ubuntu22.04-Desktop-1.1.0
```

### File Description

 * target/Kr260/
   + boot/
     - boot.scr                                                    : Stage Script file
     - uEnv.txt                                                    : U-Boot environment variables for linux boot
     - devicetree-5.15.108-zynqmp-fpga-trial-kr260-revB.dtb        : Linux Device Tree Blob
     - devicetree-5.15.108-zynqmp-fpga-trial-kr260-revB.dts        : Linux Device Tree Source
 * files/
   + vmlinuz-5.15.108-zynqmp-fpga-trial-2                          : Linux Kernel Image
 * ubuntu22.04-desktop-rootfs.tgz.files/                           : Ubuntu 22.04 Desktop Root File System
   + x00 .. x16                                                    : (splited files)
 
### Format SD-Card

[./doc/install/format-disk.md](format-disk.md)

### Write to SD-Card

#### Mount SD-Card

```console
shell# mount /dev/sdc1 /mnt/usb1
shell# mount /dev/sdc2 /mnt/usb2
```
#### Make Boot Partition

```console
shell# cp target/Kr260/boot/* /mnt/usb1
shell# gzip -d -c files/vmlinuz-5.15.108-zynqmp-fpga-trial-2 > /mnt/usb1/image-5.15.108-zynqmp-fpga-trial
```

#### Make RootFS Partition

```console
shell# (cat ubuntu22.04-desktop-rootfs.tgz.files/*) | tar xfz - -C /mnt/usb2
```

#### Add boot partition mount position to /etc/fstab

```console
shell# mkdir /mnt/usb2/mnt/boot
shell# cat <<EOT >> /mnt/usb2/etc/fstab
/dev/sda1	/mnt/boot	auto	defaults	0	0
EOT
```

#### Change system console

If you want to change the system console, change the "linux_boot_args_console" variable in "/mnt/usb1/uEnv.txt".

##### Change to serial port

```text:/mnt/usb1/uEnv.txt

linux_boot_args_console=console=ttyPS1,115200

```

##### Change to Motitnor+Keyboard

```text:/mnt/usb1/uEnv.txt

linux_boot_args_console=console=tty1

```

#### Unmount SD-Card

```console
shell# umount /mnt/usb1
shell# umount /mnt/usb2
```

