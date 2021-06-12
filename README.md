# Ramplify

Ramplify offers funcitonality for streaming audio via bluetooth, airplay and upnp to your raspberry pi and to other devices connected to it.

Simply download, flash to a sd-card and enjoy!

After installation Ramplify offers the following functionalities:
- Automated Access Point if no WIFI is detected after boot
- Always reachable homepage hosted by the pi powered by node-red
- Change hostname, add wifi or change the accessibility of your raspberry pi
- Further functionalities, including output-change on raspberry (I2S, 3.5mm-jack, HDMI)

## Image Installation

Get the file via the download link below and flash it to an empty sd card. Put it into your raspberry pi 3, 4 or zero. That's it!

Download Software for Raspberry Pi 3,4 and Zero (no AAC Codec implemented)                                                             
https://bwsyncandshare.kit.edu/s/dm6EnfwaExpejkd?path=%2FRamplify%2FRamplify%20v1.0%2FV1.0

Download Software for Raspberry Pi 3 and 4 (AAC Codec implemented)                                                  
https://bwsyncandshare.kit.edu/s/dm6EnfwaExpejkd/download



## How to use

After installing simply reboot the pi, connect to its hotspot "Ramplify" (password: myramplify123%) and access the configuration page via ramplify.audio for teaching wifi and change configurations. The pi-account password in Raspian is "ramplify" .. change that immediately!

## References

- [BlueALSA: Bluetooth Audio ALSA Backend](https://github.com/Arkq/bluez-alsa)
- [Shairport Sync: AirPlay Audio Receiver](https://github.com/mikebrady/shairport-sync)
- [Raspotify: Spotify Connect client for the Raspberry Pi that Just Works™](https://github.com/dtcooper/raspotify)
- [gmrender-resurrect: Headless UPnP Renderer](http://github.com/hzeller/gmrender-resurrect)
- [Snapcast: Synchronous audio player](https://github.com/badaix/snapcast)
- [Access Point by ajfisher](https://gist.github.com/ajfisher/a84889e64565d7a74888)
- [NODE-RED](https://nodered.org/)
