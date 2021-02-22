# Ramplify

This is a inofficial extension of nico kaisers rpi-audio-receiver.

Ramplify offers funcitonality for streaming audio via bluetooth, airplay and upnp to your raspberry pi and to other devices connected to it. This is possible through nico kaiser and his github repo, see #references.

Ramplify can be installed via image or via standard package installation directly from github. 

After installation it offers the following functionalities:
- Automated Access Point if no WIFI is detected after Boot
- Always reachable homepage hosted by the pi which can be accessed with www.rampli.fy
  - Choose streaming functionalities you need, skip installing others (f.e. no upnp)
  - Learn new wifi networks / update wifi credentials
  - Further functionalities, including output-change on raspberry (I2S, 3.5mm-jack, HDMI)

## Package Installation on stock debian

to be implemented..

## How to use

After installing simply reboot the pi, connect to its hotspot "Ramplify" and access the configuration page via www.rampli.fy before or after teaching WIFI.

## Image Installation

Get the file from OneDrive and flash it to an empty sd card. After booting (may take a while) the hotspot should open automatically. Setup wifi and enjoy!

Download:
https://studhsheilbronnde-my.sharepoint.com/:u:/g/personal/tbreunig_stud_hs-heilbronn_de/EeGf9gxBA99CplUkhdmihwMB-Zg190lrX_9iSLIpoL6Diw?e=UN9q1Q

## References

- [BlueALSA: Bluetooth Audio ALSA Backend](https://github.com/Arkq/bluez-alsa)
- [Shairport Sync: AirPlay Audio Receiver](https://github.com/mikebrady/shairport-sync)
- [Raspotify: Spotify Connect client for the Raspberry Pi that Just Works™](https://github.com/dtcooper/raspotify)
- [gmrender-resurrect: Headless UPnP Renderer](http://github.com/hzeller/gmrender-resurrect)
- [Snapcast: Synchronous audio player](https://github.com/badaix/snapcast)
- [pivumeter: ALSA plugin for displaying VU meters on various Raspberry Pi add-ons](https://github.com/pimoroni/pivumeter)
- [Adafruit: Read-Only Raspberry Pi](https://github.com/adafruit/Raspberry-Pi-Installer-Scripts/blob/master/read-only-fs.sh)
- [Access Point](https://gist.github.com/ajfisher/a84889e64565d7a74888)
