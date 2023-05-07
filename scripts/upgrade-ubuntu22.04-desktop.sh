#### Setup APT

export distro=jammy
export LANG=C
apt update

#### Install Ubuntu Desktop

apt install -y ubuntu-desktop

#### Install ZynqMP-FPGA-Xserver

dpkg -i /home/fpga/debian/xserver-xorg-video-armsoc-xilinx_1.5-trial-13_arm64.deb
cp      /home/fpga/debian/xorg.conf /etc/X11

#### Install libgl1-mesa for Lima

dpkg -i /home/fpga/debian/libgl1-mesa-xlnx-dri_22.2.5-0ubuntu0.1~22.04.1_arm64.deb

#### Setup DRM Lima Driver

echo "lima" > /etc/modules-load.d/lima.conf
echo "options lima of_400_id=arm,mali-400" > /etc/modprobe.d/lima.conf

#### Change Display Manager gdm -> lightdm

echo 'Please choose "lightdm" instead of "gdm"'
apt install -y libpam-gnome-keyring libpam-kwallet5
apt install -y lightdm lightdm-settings slick-greeter

#### Clean Cache

apt-get clean

##### Create Debian Package List

dpkg -l > dpkg-desktop-list.txt
