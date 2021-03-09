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

- sudo apt-get install git -y
- git clone https://github.com/Golgomaph/Ramplify
- cd Ramplify
- sudo ./install.sh

After installation restart your raspberry pi. The main functions now are successfully installed, but the webpage configuration is missing.
To get webpage functionality simply connect to the now available hotspot "Ramplify" and enter "192.168.40.1:1880" in your browser.

You should now see an empty node-red, if so everything worked so far.

Now follow the steps below:
![image](https://user-images.githubusercontent.com/74306376/110494397-df7f4400-80f3-11eb-97e0-b294fe5c73a7.png)
![image](https://user-images.githubusercontent.com/74306376/110494436-e6a65200-80f3-11eb-93f3-05a3b8757302.png)



## How to use

After installing simply reboot the pi, connect to its hotspot "Ramplify" and access the configuration page via www.ramplify.audio before or after teaching WIFI.

## Image Installation

Get the file from OneDrive and flash it to an empty sd card. After booting (may take a while) the hotspot should open automatically. Setup wifi and enjoy!

Download:
https://studhsheilbronnde-my.sharepoint.com/:u:/g/personal/tbreunig_stud_hs-heilbronn_de/Ears5yHJcQ9CtUgZckBuI3oBo0HlH7ouuwqO1Vu1O_mE1Q?e=QMoMTK

## References

- [BlueALSA: Bluetooth Audio ALSA Backend](https://github.com/Arkq/bluez-alsa)
- [Shairport Sync: AirPlay Audio Receiver](https://github.com/mikebrady/shairport-sync)
- [Raspotify: Spotify Connect client for the Raspberry Pi that Just Works™](https://github.com/dtcooper/raspotify)
- [gmrender-resurrect: Headless UPnP Renderer](http://github.com/hzeller/gmrender-resurrect)
- [Snapcast: Synchronous audio player](https://github.com/badaix/snapcast)
- [pivumeter: ALSA plugin for displaying VU meters on various Raspberry Pi add-ons](https://github.com/pimoroni/pivumeter)
- [Adafruit: Read-Only Raspberry Pi](https://github.com/adafruit/Raspberry-Pi-Installer-Scripts/blob/master/read-only-fs.sh)
- [Access Point](https://gist.github.com/ajfisher/a84889e64565d7a74888)
