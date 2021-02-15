#!/bin/bash -e

if (!(systemctl -q is-active bluealsa-aplay) &&
!(systemctl -q is-active hostapd) &&
!(systemctl -q is-active shairport-sync) &&
!(systemctl -q is-active gmediarender)) then
echo "Select new passwort"
echo "---------------------------------------------"
sudo passwd pi;

echo "Choose hostname"
echo "---------------------------------------------"
read -p "Hostname [$(hostname)]: " HOSTNAME
sudo raspi-config nonint do_hostname ${HOSTNAME:-$(hostname)}

CURRENT_PRETTY_HOSTNAME=$(hostnamectl status --pretty)
read -p "Pretty hostname [${CURRENT_PRETTY_HOSTNAME:-Raspberry Pi}]: " PRETTY_HOSTNAME
sudo hostnamectl set-hostname --pretty "${PRETTY_HOSTNAME:-${CURRENT_PRETTY_HOSTNAME:-Raspberry Pi}}"
fi;

echo "Update OS?"
read REPLYUPDATE

echo
echo "Choosing functions"
echo "---------------------------------------------"
echo "Do you want to..."
echo -n "  ...stream audio via bluetooth (BlueALSA)? [y/N] "
read REPLYBLUETOOTH
echo -n "  ...stream audio via WiFi-UPnP (gmrender-resurrect)? [y/N] "
read REPLYUPNP
echo -n "  ...stream audio via Apple AirPlay (shairport-sync)? [y/N] "
read REPLYSHAIRPORT
echo -n "  ...see RasPi as streaming device in Spotify (Raspotify)? [y/N] "
read REPLYSPOTIFY
echo -n "  ...use multi-room functionality using more then one RasPi (snapclient})? [y/N] "
read REPLYSNAPCAST
echo -n "  ...generate wifi access-point if no known wifi is available? [y/N] "
read REPLYAUTOAP

echo
echo "Installing components"
echo "---------------------------------------------"
if [[ "$REPLYUPDATE" =~ ^(yes|y|Y)$ ]]; then sudo apt-get install update; fi;
if [[ "$REPLYUPDATE" =~ ^(yes|y|Y)$ ]]; then sudo apt-get install upgrade; fi;
if [[ "$REPLYBLUETOOTH" =~ ^(yes|y|Y)$ ]]; then sudo ./install-bluetooth.sh; fi;
if [[ "$REPLYUPNP" =~ ^(yes|y|Y)$ ]]; then sudo ./install-upnp.sh; fi;
if [[ "$REPLYSHAIRPORT" =~ ^(yes|y|Y)$ ]]; then sudo ./install-shairport.sh; fi;
if [[ "$REPLYSPOTIFY" =~ ^(yes|y|Y)$ ]]; then sudo ./install-spotify.sh; fi;
if [[ "$REPLYSNAPCAST" =~ ^(yes|y|Y)$ ]]; then sudo ./install-snapcast-client.sh; fi;
if [[ "$REPLYAUTOAP" =~ ^(yes|y|Y)$ ]]; then yes | ./install-autoap.sh; fi;

sudo ./rebootafterfinish.sh
