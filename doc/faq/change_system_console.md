## Change system console

To change the system console, change the "linux_boot_args_console" variable in "/mnt/boot/uEnv.txt".

### Change to serial port

#### Ultra96/Ultra96-V2

```text:/mnt/boot/uEnv.txt

linux_boot_args_console=console=ttyPS0,115200

```

#### KV260

```text:/mnt/boot/uEnv.txt

linux_boot_args_console=console=ttyPS1,115200

```

### Change to Motitnor+Keyboard

```text:/mnt/boot/uEnv.txt

linux_boot_args_console=console=tty1

```

### Change by bootmenu

For Ultra96/Ultra96-V2/Kv260, the system console can be changed in the boot menu when u-boot starts.
In this case, add the following to the end of "/mnt/boot/uEnv.txt".

```text:/mnt/boot/uEnv.txt

########################################################################
# Boot Menu Example
########################################################################
bootmenu_0=Boot Default=boot
bootmenu_1=Boot ttyPS0=env set linux_boot_args_console console=ttyPS0,115200 && boot
bootdelay=5

```
