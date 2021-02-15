#!/bin/bash -e

if [[ $(id -u) -ne 0 ]] ; then echo "Please run as root" ; exit 1 ; fi

echo "Installing snapclient"
#echo
#echo -n "Do you want to use multi-room functionality using more then one RasPi (snapclient})? [y/N] "
#read REPLY
#if [[ ! "$REPLY" =~ ^(yes|y|Y)$ ]]; then exit 0; fi

apt install --no-install-recommends -y snapclient
echo "Finished."
echo "~"
