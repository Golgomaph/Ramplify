#!/bin/bash -e

yes | bash <(curl -sL https://raw.githubusercontent.com/node-red/linux-installers/master/deb/update-nodejs-and-nodered)

sudo systemctl enable nodered.service

sudo rm /home/pi/.node-red/settings.js
sudo cp /home/pi/Ramplify/templates/settings.js.template /home/pi/.node-red/
sudo mv /home/pi/.node-red/settings.js.template /home/pi/.node-red/settings.js
