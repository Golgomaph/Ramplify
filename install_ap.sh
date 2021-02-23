#!/bin/bash -e

echo "---------------------------------------------"
echo "Installing ap"
apt-get install hostapd wpasupplicant dnsmasq
update-rc.d -f hostapd remove
update-rc.d -f dnsmasq remove

echo "---------------------------------------------"
cat ./templates/interfaces.template >> /etc/network/interfaces
echo "Interface changed"

echo "---------------------------------------------"
sudo raspi-config nonint do_boot_wait 0
echo "Setting the boot option wait for network"

echo "---------------------------------------------"
cat ./templates/hostapd.template >> /etc/default/hostapd
echo "Hostapd changed"

echo "---------------------------------------------"
cat ./templates/hostapd.conf.template >> /etc/hostapd/hostapd.conf
echo "Hostapd.conf changed"

echo "---------------------------------------------"
echo "Installing finished"
