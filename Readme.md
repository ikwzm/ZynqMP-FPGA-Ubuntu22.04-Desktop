ZynqMP-FPGA-Ubuntu22.04-Desktop
====================================================================================

Overview
------------------------------------------------------------------------------------

### Introduction

This Repository provides a Ubuntu22.04-Desktop(use GUI) for Zynq MPSoC.

### Note

**The Linux Kernel Image and Ubuntu22.04 RootFS provided in this repository is not official.**

**I modified it to my liking. Please handle with care.**

### Features

* Hardware
  + Ultra96    : Xilinx Zynq UltraScale+ MPSoC development board based on the Linaro 96Boards specification. 
  + Ultra96-V2 : updates and refreshes the Ultra96 product that was released in 2018.
  + KV260      : Kria KV260 Vision AI Startar Kit.
  + KR260      : Kria KR260 Robotics  Startar Kit.
* Boot Loader
  + FSBL(First Stage Boot Loader for ZynqMP)
  + PMU Firmware(Platform Management Unit Firmware)
  + BL31(ARM Trusted Firmware Boot Loader stage 3-1)
  + U-Boot xilinx-v2019.2 (customized)
* [Linux Kernel Version 5.15.108-zynqmp-fpga-trial](https://github.com/ikwzm/ZynqMP-FPGA-Linux-Kernel-5.15/tree/5.15.108-zynqmp-fpga-trial-2)
  + [linux-stable 5.10.120](https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git//tag/?h=v5.10.120)
  + Patched equivalent to linux-xlnx v2022.2
  + Enable Device Tree Overlay with Configuration File System
  + Enable FPGA Manager
  + Enable FPGA Bridge
  + Enable FPGA Reagion
  + Enable ATWILC3000 Linux Driver for Ultra96-V2
  + Enable Lima(Open Source Mali-400 Device Driver)
    - Patch to lima for multiple clocks
    - Patch to lima for multiple interrupt names
    - Patch to lima for alternative device tree ID
    - Patch to xlnx_drm for default alignment size
    - Patch to xlnx_drm for enable data cache
  + Other config -> [files/config-5.15.108-zynqmp-fpga-trial-2](files/config-5.15.108-zynqmp-fpga-trial-2)
* Ubuntu22.04.2(jammy) Desktop(use GUI) Root File System
  + Installed build-essential
  + Installed ubuntu-desktop
  + Installed lightdm
  + Installed ddx xlnx (xserver-xorg-video-armsoc-xilinx)
  + Installed dri xlnx (libgl1-mesa-xlnx-dri)
  + Installed ruby python python3
  + Installed Other package list -> [files/ubuntu22.04-desktop-dpkg-list.txt](files/ubuntu22.04-desktop-dpkg-list.txt)

Install
------------------------------------------------------------------------------------

### Install to SD-Card

* [Ultra96](doc/install/ultra96-desktop.md)
* [Ultra96-V2](doc/install/ultra96v2-desktop.md)
* [KV260](doc/install/kv260-desktop.md)
* [KR260](doc/install/kr260-desktop.md)

### Setup Ultra96/Ultra96-V2/KV260/KR260 borad

* Put the SD-Card in the slot on Ultra96/Ultra96-V2/Kv260/Kr260.
* Plug in your Display Port monitor into the Ultra96/Ultra96-V2/Kv260/Kr260.
* Plug in a USB mouse and USB keyboard into the USB ports of the Ultra96/Ultra96-V2/Kv260/Kr260.

### Starting Ultra96/Ultra96-V2/KV260/KR260 board

* Turn on the Ultra96/Ultra96-V2/KV260/KR260.
* After a few seconds, the Ubuntu login screen will appear on the display.
* Your username is "fpga". Password is set to "fpga". Please login.
* The username and password for administrator rights is "admin".

FAQ
------------------------------------------------------------------------------------

* [Change system console](doc/faq/change_system_console.md)
* [Change boot runlevel](doc/faq/change_boot_runlevel.md)
* [Setup WiFi](doc/faq/setup_wifi.md)
* [Segmentation fault when running glmark2](doc/faq/glmark2.md)

Build 
------------------------------------------------------------------------------------

* Build Boot Loader
  + [Ultra96](doc/build/ultra96-boot.md)
  + [Ultra96-V2](doc/build/ultra96v2-boot.md)
* Build Debian Package for ddx xlnx (xserver-xorg-video-armsoc-xilinx)
  + https://github.com/ikwzm/xf86-video-armsoc-xilinx/tree/v1.5-trial-13
* Build Debian Package for dri xlnx (libgl1-mesa-xlnx-dri)
  + https://github.com/ikwzm/mesa-xlnx/tree/mesa-xlnx-22.2.5-0ubuntu0.1-22.04.1
* [Build Linux Kernel 5.15.108-zynqmp-fpga-trial](doc/build/linux-5.15.108-zynqmp-fpga-trial.md)
* [Build Ubuntu 22.04 Desktop RootFS](doc/build/ubuntu22.04-desktop.md)
