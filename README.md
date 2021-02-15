# Ramplify

This is a inofficial extension of nico kaisers rpi-audio-receiver.

- Raspberry Pi with Bluetooth support (tested with Raspberry Pi 3, 4 and Zero W) or USB dongle (highly recommended!)
- Raspberry Pi OS Buster Lite (tested with August 2020 version)
- Internal audio, HDMI, USB or I2S Audio adapter (tested with [Adafruit USB Audio Adapter](https://www.adafruit.com/product/1475),  [pHAT DAC](https://shop.pimoroni.de/products/phat-dac), and [HifiBerry DAC+](https://www.hifiberry.com/products/dacplus/))

## Package Installation on stock debian

The installation script asks whether to install each component.

    sudo apt-get install git
    git clone https://github.com/Golgomaph/ramplify.git
    cd ramplify
    sudo ./install.sh

## Image Installation

to be uploaded..

## References

- [BlueALSA: Bluetooth Audio ALSA Backend](https://github.com/Arkq/bluez-alsa)
- [Shairport Sync: AirPlay Audio Receiver](https://github.com/mikebrady/shairport-sync)
- [Raspotify: Spotify Connect client for the Raspberry Pi that Just Works™](https://github.com/dtcooper/raspotify)
- [gmrender-resurrect: Headless UPnP Renderer](http://github.com/hzeller/gmrender-resurrect)
- [Snapcast: Synchronous audio player](https://github.com/badaix/snapcast)
- [pivumeter: ALSA plugin for displaying VU meters on various Raspberry Pi add-ons](https://github.com/pimoroni/pivumeter)
- [Adafruit: Read-Only Raspberry Pi](https://github.com/adafruit/Raspberry-Pi-Installer-Scripts/blob/master/read-only-fs.sh)
- [Access Point](https://gist.github.com/ajfisher/a84889e64565d7a74888)
