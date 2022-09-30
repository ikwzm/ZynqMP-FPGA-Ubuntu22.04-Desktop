## Setup WiFi

The Ultra96/Ultra96-V2 connects to your network through WiFi.
It may be better to create a configuration file on the host side in advance and write it to RootFS.
Of cause, you can boot Ultra96/Ultra96-V2 later and configure it there.

  * ssid: ssssssss
  * passphrase: ppppppppp

```console
shell# cat <<EOT > /mnt/usb2/etc/netplan/99-network-config.yaml
network:
  version: 2
  renderer: NetworkManager
  wifis:
    wlan0:
      optional: true
      access-points:
        "ssssssss" :
            password: "ppppppppp"
      dhcp4: true
EOT
```
