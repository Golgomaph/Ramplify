#!/bin/bash -e

echo "---------------------------------------------"
echo "Installing ap"
apt-get install hostapd wpasupplicant dnsmasq
update-rc.d -f hostapd remove
update-rc.d -f dnsmasq remove

echo "---------------------------------------------"
echo "Interface changed"
cat ./templates/interface.template >> ~/etc/network/interfaces

echo "---------------------------------------------"
echo "Setting the boot option wait for network"
sudo raspi-config nonint do_boot_wait 0

echo "---------------------------------------------"
echo "Hostapd changed"
cat ./templates/hostapd.template >> ~/etc/default/hostapd

echo "---------------------------------------------"
echo "Hostapd.conf changed"
cat ./templates/hostapd.conf.template >> ~/etc/hostapd/hostapd/hostapd.conf

echo "---------------------------------------------"
echo "Installing finished"
