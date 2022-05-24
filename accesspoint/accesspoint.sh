#!/bin/bash

# Enable or disable wifi access point on this device.
# Made by Kyle Huang for Corvus Industries

if [ $1 == "start" ]
then
	# disable access point services
	sudo systemctl stop dnsmasq
	sudo systemctl stop dhcpcd
	sudo systemctl stop hostapd

	# modify config file
	sudo sed -i 's/# denyinterfaces wlan0/denyinterfaces wlan0/' /etc/dhcpcd.conf

	# enable access point services
	sudo systemctl start dhcpcd
	sudo systemctl start dnsmasq
	sudo systemctl start hostapd
	exit 0
else
	if (( $1 == "stop" ))
	then
		# disable access point services
		sudo systemctl stop dnsmasq
		sudo systemctl stop dhcpcd
		sudo systemctl stop hostapd

		# modify config file
		sudo sed -i 's/denyinterfaces wlan0/# denyinterfaces wlan0/' /etc/dhcpcd.conf

		# enable access point services
		sudo systemctl start dhcpcd
		exit 0
	fi
fi

echo "Please provide an argument (e.g.: accesspoint (start | stop))"
