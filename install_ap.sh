#!/bin/bash -e

apt-get install hostapd wpasupplicant dnsmasq -y
update-rc.d -f hostapd remove
update-rc.d -f dnsmasq remove

cat ./templates/interfaces.template >> /etc/network/interfaces

sudo raspi-config nonint do_boot_wait 0

cat ./templates/hostapd.template >> /etc/default/hostapd

cat ./templates/hostapd.conf.template >> /etc/hostapd/hostapd.conf


