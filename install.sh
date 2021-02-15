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
echo "Installing components"
echo "---------------------------------------------"
if [[ "$REPLYUPDATE" =~ ^(yes|y|Y)$ ]]; then sudo apt-get install update; fi;
if [[ "$REPLYUPDATE" =~ ^(yes|y|Y)$ ]]; then sudo apt-get install upgrade; fi;

echo
echo -n "----------------------------------------------------------------"
echo -n "Installation finished. Reboot now? [y/N] "
read REPLY
if [[ ! "$REPLY" =~ ^(yes|y|Y)$ ]]; then exit 0; fi
sudo reboot
