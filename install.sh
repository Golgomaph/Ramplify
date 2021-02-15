#!/bin/bash -e

if [ ! -f /etc/passcheck ]; then

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
echo "192.168.40.1 simple.audio" >> /etc/hosts
echo "set" > /etc/passcheck;
fi;

echo -n "Update raspian? [y/n] >> "
read REPLYUPDATE
if [[ "$REPLYUPDATE" =~ ^(yes|y|Y)$ ]]; then sudo apt-get install update; fi;
if [[ "$REPLYUPDATE" =~ ^(yes|y|Y)$ ]]; then sudo apt-get install upgrade; fi;

echo
echo -n "Installation finished. You may reboot now.. Reboot? >> [y/N] "
read REPLY
if [[ ! "$REPLY" =~ ^(yes|y|Y)$ ]]; then sudo reboot; fi;
