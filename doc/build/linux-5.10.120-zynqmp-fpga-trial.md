## Build Linux 5.10.120-zynqmp-fpga-trial

### Download ZynqMP-FPGA-Linux-5.10-Trial

```console
shell$ wget https://github.com/ikwzm/ZynqMP-FPGA-Linux-5.10-Trial/archive/refs/tags/5.10.120-zynqmp-fpga-trial-16.tar.gz
shell$ tar xfz 5.10.120-zynqmp-fpga-trial-16.tar.gz
shell$ cd ZynqMP-FPGA-Linux-5.10-Trial-5.10.120-zynqmp-fpga-trial-16
```

### Copy Linux Kernel Image to this repository

```console
shell$ cp ZynqMP-FPGA-Linux-5.10-Trial-5.10.120-zynqmp-fpga-trial-16/vmlinuz-5.10.120-zynqmp-fpga-trial-16      ./files
shell$ cp ZynqMP-FPGA-Linux-5.10-Trial-5.10.120-zynqmp-fpga-trial-16/files/config-5.10.120-zynqmp-fpga-trial-16 ./files
```

### Copy Linux Image and Header Debian Packages to this repository

```console
shell$ cp ZynqMP-FPGA-Linux-5.10-Trial-5.10.120-zynqmp-fpga-trial-16/linux-image-5.10.120-zynqmp-fpga-trial_5.10.120-zynqmp-fpga-trial-16_arm64.deb ./files/
shell$ cp ZynqMP-FPGA-Linux-5.10-Trial-5.10.120-zynqmp-fpga-trial-16/linux-headers-5.10.120-zynqmp-fpga-trial_5.10.120-zynqmp-fpga-trial-16_arm64.deb .files/
```

### Copy devicetree for KV260

```console
shell$ install -d target/Kv260/boot/
shell$ cp ZynqMP-FPGA-Linux-5.10-Trial-5.10.120-zynqmp-fpga-trial-16/devicetrees/5.10.120-zynqmp-fpga-trial-16/zynqmp-kv260-revB.dtb target/Kv260/boot/devicetree-5.10.120-zynqmp-fpga-trial-kv260-revB.dtb
shell$ dtc -I dtb -O dts -@ -o target/Kv260/boot/devicetree-5.10.120-zynqmp-fpga-trial-kv260-revB.dts target/Kv260/boot/devicetree-5.10.120-zynqmp-fpga-trial-kv260-revB.dtb
```

### Copy devicetree for Ultra96

```console
shell$ install -d target/Ultra96/boot/
shell$ cp ZynqMP-FPGA-Linux-5.10-Trial-5.10.120-zynqmp-fpga-trial-16/devicetrees/5.10.120-zynqmp-fpga-trial-16/avnet-ultra96-rev1.dtb target/Ultra96/boot/devicetree-5.10.120-zynqmp-fpga-trial-ultra96.dtb
shell$ dtc -I dtb -O dts -@ -o target/Ultra96/boot/devicetree-5.10.120-zynqmp-fpga-trial-ultra96.dts target/Ultra96/boot/devicetree-5.10.120-zynqmp-fpga-trial-ultra96.dtb
```

### Copy devicetree for Ultra96-V2

```console
shell$ install -d target/Ultra96-V2/boot/
shell$ cp ZynqMP-FPGA-Linux-5.10-Trial-5.10.120-zynqmp-fpga-trial-16/devicetrees/5.10.120-zynqmp-fpga-trial-16/avnet-ultra96v2-rev1.dtb target/Ultra96-V2/boot/devicetree-5.10.120-zynqmp-fpga-trial-ultra96v2.dtb
shell$ dtc -I dtb -O dts -@ -o target/Ultra96-V2/boot/devicetree-5.10.120-zynqmp-fpga-trial-ultra96v2.dts target/Ultra96-V2/boot/devicetree-5.10.120-zynqmp-fpga-trial-ultra96v2.dtb
```

