#!/bin/bash -e

apt-get install hostapd wpasupplicant dnsmasq -y
update-rc.d -f hostapd remove
update-rc.d -f dnsmasq remove

cat ./templates/interfaces.template >> /etc/network/interface

iface test_network inet dhcp

sudo raspi-config nonint do_boot_wait 0

cat ./templates/hostapd.template >> /etc/default/hostapd


cat ./templates/hostapd.conf.template >> /etc/hostapd/hostapd.conf
#hostapd -d /etc/hostapd/hostapd.conf
cat ./templates/rc.local.template >> /etc/rc.local

sudo systemctl unmask hostapd
sudo systemctl enable hostapd
service hostapd start
ifconfig wlan0 192.168.40.1
service dnsmasq start
