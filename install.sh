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

echo "192.168.40.1 simple.audio" >> /etc/hosts
echo "set" > /etc/passcheck;
fi;

echo "Update raspian"
echo "---------------------------------------------"
sudo apt-get install update

echo "Upgrade raspian"
echo "---------------------------------------------"
sudo apt-get install upgrade

#sudo ./install_ap.sh
echo -n "Installation finished. You may reboot now.. Reboot? >> [y/N] "
read REPLY
if [[ ! "$REPLY" =~ ^(yes|y|Y)$ ]]; then exit 0; fi
sudo reboot
