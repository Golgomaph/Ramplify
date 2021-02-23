echo "Installing ap"
apt-get install hostapd wpasupplicant dnsmasq
update-rc.d -f hostapd remove
update-rc.d -f dnsmasq remove
cat ./templates/interface.template >> ~/etc/network/interfaces

sudo raspi-config nonint do_boot_wait 0
cat ./templates/hostapd.template >> ~/etc/default/hostapd
cat ./templates/hostapd.conf.template >> ~/etc/hostapd/hostapd/hostapd.conf
