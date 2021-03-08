#!/bin/bash -e

if [ ! -f /etc/passcheck ]; then

echo "Select new passwort"
echo "---------------------------------------------"
sudo passwd pi;

echo "Hostname is Ramplify"
echo "---------------------------------------------"
#read -p "Hostname [$(hostname)]: " HOSTNAME
export HOSTNAME="Ramplify"
sudo raspi-config nonint do_hostname ${HOSTNAME:-$(hostname)}

CURRENT_PRETTY_HOSTNAME=$(hostnamectl status --pretty)
#read -p "Pretty hostname [${CURRENT_PRETTY_HOSTNAME:-Raspberry Pi}]: " PRETTY_HOSTNAME
CURRENT_PRETTY_HOSTNAME="Ramplify"
sudo hostnamectl set-hostname --pretty "${PRETTY_HOSTNAME:-${CURRENT_PRETTY_HOSTNAME:-Raspberry Pi}}"

echo "192.168.40.1 ramplify.audio" >> /etc/hosts
#echo "interface wlan0" >> /etc/dhcpcd.conf
#echo "static ip_address=192.168.40.1" >> /etc/dhcpcd.conf
#echo "static routers=192.168.0.1" >> /etc/dhcpcd.conf
#echo "static domain_name_servers=8.8.8.8 8.8.4.4" >> /etc/dhcpcd.conf
echo "set" > /etc/passcheck;


fi;

echo "Update raspian"
echo "---------------------------------------------"
sudo apt-get update
echo "Update finished"

echo "Upgrade raspian"
echo "---------------------------------------------"
sudo DEBIAN_FRONTEND=noninteractive apt-get upgrade -y;
echo "Upgrade finished"

echo "Installing Bluetooth"
echo "---------------------------------------------"
sudo ./install-bluetooth.sh;
echo "Installing Blueetooth finished"

echo "Installing Shairport"
echo "---------------------------------------------"
sudo ./install-shairport.sh;
echo "Installing shairport finished"

echo "Installing Snapcast"
echo "---------------------------------------------"
sudo ./install-snapcast-client.sh;
echo "Installing Snapcast finished"

echo "Installing Spotify"
echo "---------------------------------------------"
sudo ./install-spotify.sh;
echo "Installing Spotify finished"

echo "Installing Upnp"
echo "---------------------------------------------"
sudo ./install-upnp.sh;
echo "Installing Upnp finished"

echo "Installing Access Point"
echo "---------------------------------------------"
sudo ./install_ap.sh;
echo "Installing Access Point finished"

echo "Installing NodeRed"
echo "---------------------------------------------"
sudo ./install_nodered.sh;
echo "Installing NodeRed finished"

echo -n "Installation finished. You may reboot now.. Reboot? >> [y/N] "
read REPLY
if [[ ! "$REPLY" =~ ^(yes|y|Y)$ ]]; then exit 0; fi
sudo reboot
