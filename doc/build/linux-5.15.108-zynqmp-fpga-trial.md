## Build Linux 5.15.108-zynqmp-fpga-trial

### Download ZynqMP-FPGA-Linux-Kernel-5.15

```console
shell$ wget https://github.com/ikwzm/ZynqMP-FPGA-Linux-Kernel-5.15/archive/refs/tags/5.15.108-zynqmp-fpga-trial-2.tar.gz
shell$ tar xfz 5.15.108-zynqmp-fpga-trial-2.tar.gz
```

### Copy Linux Kernel Image to this repository

```console
shell$ cp ZynqMP-FPGA-Linux-Kernel-5.15-5.15.108-zynqmp-fpga-trial-2/vmlinuz-5.15.108-zynqmp-fpga-trial-2      ./files
shell$ cp ZynqMP-FPGA-Linux-Kernel-5.15-5.15.108-zynqmp-fpga-trial-2/files/config-5.15.108-zynqmp-fpga-trial-2 ./files
```

### Copy Linux Image and Header Debian Packages to this repository

```console
shell$ cp ZynqMP-FPGA-Linux-Kernel-5.15-5.15.108-zynqmp-fpga-trial-2/linux-image-5.15.108-zynqmp-fpga-trial_5.15.108-zynqmp-fpga-trial-2_arm64.deb ./debian/
shell$ cp ZynqMP-FPGA-Linux-Kernel-5.15-5.15.108-zynqmp-fpga-trial-2/linux-headers-5.15.108-zynqmp-fpga-trial_5.15.108-zynqmp-fpga-trial-2_arm64.deb ./debian/
```

### Copy devicetree for KV260

```console
shell$ ./ZynqMP-FPGA-Linux-Kernel-5.15-5.15.108-zynqmp-fpga-trial-2/scripts/install-linux-5.15.108-zynqmp-fpga-trial.sh Kv260 -T -d ./target/Kv260/boot -v
```

or

```console
shell$ install -d target/Kv260/boot/
shell$ cp ZynqMP-FPGA-Linux-Kernel-5.15-5.15.108-zynqmp-fpga-trial-2/devicetrees/5.15.108-zynqmp-fpga-trial-2/zynqmp-kv260-revB.dtb ./target/Kv260/boot/devicetree-5.15.108-zynqmp-fpga-trial-kv260-revB.dtb
shell$ dtc -I dtb -O dts --symbols -o ./target/Kv260/boot//devicetree-5.15.108-zynqmp-fpga-trial-kv260-revB.dts ./target/Kv260/boot//devicetree-5.15.108-zynqmp-fpga-trial-kv260-revB.dtb
```

### Copy devicetree for KR260

```console
shell$ ./ZynqMP-FPGA-Linux-Kernel-5.15-5.15.108-zynqmp-fpga-trial-2/scripts/install-linux-5.15.108-zynqmp-fpga-trial.sh Kr260 -T -d ./target/Kr260/boot -v
```

or

```console
shell$ install -d target/Kr260/boot/
shell$ cp ZynqMP-FPGA-Linux-Kernel-5.15-5.15.108-zynqmp-fpga-trial-2/devicetrees/5.15.108-zynqmp-fpga-trial-2/zynqmp-kr260-revB.dtb ./target/Kr260/boot/devicetree-5.15.108-zynqmp-fpga-trial-kr260-revB.dtb
shell$ dtc -I dtb -O dts --symbols -o ./target/Kr260/boot/devicetree-5.15.108-zynqmp-fpga-trial-kr260-revB.dts ./target/Kr260/boot/devicetree-5.15.108-zynqmp-fpga-trial-kr260-revB.dtb
```

### Copy devicetree for Ultra96

```console
shell$ ./ZynqMP-FPGA-Linux-Kernel-5.15-5.15.108-zynqmp-fpga-trial-2/scripts/install-linux-5.15.108-zynqmp-fpga-trial.sh Ultra96 -T -d ./target/Ultra96/boot -v
```

or

```console
shell$ install -d target/Ultra96/boot/
shell$ cp ZynqMP-FPGA-Linux-Kernel-5.15-5.15.108-zynqmp-fpga-trial-2/devicetrees/5.15.108-zynqmp-fpga-trial-2/avnet-ultra96-rev1.dtb ./target/Ultra96/boot/devicetree-5.15.108-zynqmp-fpga-trial-ultra96.dtb
shell$ dtc -I dtb -O dts --symbols -o ./target/Ultra96/boot/devicetree-5.15.108-zynqmp-fpga-trial-ultra96.dts ./target/Ultra96/boot/devicetree-5.15.108-zynqmp-fpga-trial-ultra96.dtb
```

### Copy devicetree for Ultra96-V2

```console
shell$ ./ZynqMP-FPGA-Linux-Kernel-5.15-5.15.108-zynqmp-fpga-trial-2/scripts/install-linux-5.15.108-zynqmp-fpga-trial.sh Ultra96-V2 -T -d ./target/Ultra96-V2/boot -v
```

or

```console
shell$ install -d target/Ultra96-V2/boot/
shell$ cp ZynqMP-FPGA-Linux-Kernel-5.15-5.15.108-zynqmp-fpga-trial-2/devicetrees/5.15.108-zynqmp-fpga-trial-2/avnet-ultra96v2-rev1.dtb ./target/Ultra96-V2/boot/devicetree-5.15.108-zynqmp-fpga-trial-ultra96v2.dtb
shell$ dtc -I dtb -O dts --symbols -o ./target/Ultra96-V2/boot/devicetree-5.15.108-zynqmp-fpga-trial-ultra96v2.dts ./target/Ultra96-V2/boot/devicetree-5.15.108-zynqmp-fpga-trial-ultra96v2.dtb
```
