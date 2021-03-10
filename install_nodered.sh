#!/bin/bash -e

sudo systemctl enable nodered.service

cd ~/.node-red
sudo npm i node-red-dashboard

sudo node-red-stop

#sudo rm /home/pi/.node-red/settings.js
sudo cp /home/pi/Ramplify/templates/settings.js.template /home/pi/.node-red/
sudo mv /home/pi/.node-red/settings.js.template /home/pi/.node-red/settings.js

yes | sudo apt install iptables-persistent
sudo iptables -I INPUT 1 -p tcp --dport 80 -j ACCEPT
sudo iptables -A PREROUTING -t nat -i wlan0 -p tcp --dport 80 -j REDIRECT --to-port 1880
sudo netfilter-persistent save
sudo netfilter-persistent reload
sudo iptables -I INPUT 1 -p tcp --dport 80 -j ACCEPT
sudo iptables -A PREROUTING -t nat -i eth0 -p tcp --dport 80 -j REDIRECT --to-port 1880
sudo netfilter-persistent save
sudo netfilter-persistent reload
