


# Install hostapd and dnsmasq
echo "Installing access point services...\n"
sudo apt-get install hostapd dnsmasq

# Temporarily disable the services
echo "Temporarily disabling services...\n"
sudo systemctl stop hostapd
sudo systemctl stop dnsmasq

# Block wlan0 (wifi device) from dhcpcd (default networking service)
echo "Blocking wlan0 on dhcpcd...\n"
sudo echo "denyinterfaces wlan0" >> /etc/dhcpcd.conf

# Set static IP
echo "Setting Static IP for PI on 192.168.5.1...\n"

sudo echo "
auto lo
iface lo inet loopback

auto eth0
iface eth0 inet dhcp

allow-hotplug wlan0
iface wlan0 inet static
    address 192.168.5.1
    netmask 255.255.255.0
    network 192.168.5.0
    broadcast 192.168.5.255
" >> /etc/network/interfaces

# Configure hostapd
echo "Configuring hostapd. Setting ssid to 'corvus-pi' and password to 'corvusindustries'..."

sudo echo "interface=wlan0
driver=nl80211
ssid=corvus-pi
hw_mode=g
channel=6
ieee80211n=1
wmm_enabled=1
ht_capab=[HT40][SHORT-GI-20][DSSS_CCK-40]
macaddr_acl=0
auth_algs=1
ignore_broadcast_ssid=0
wpa=2
wpa_key_mgmt=WPA-PSK
wpa_passphrase=corvusindustries
rsn_pairwise=CCMP" >> /etc/hostapd/hostapd.conf

# Configure hostapd config file location
sudo echo "DAEMON_CONF=\"/etc/hostapd/hostapd.conf\"" >> /etc/default/hostapd

# Configure dnsmasq
echo "Moving old dnsmasq config file to /etc/dnsmasq.conf.original"

sudo mv /etc/dnsmasq.conf /etc/dnsmasq.conf.original
sudo echo "
interface=wlan0 
listen-address=192.168.5.1
bind-interfaces 
server=8.8.8.8
domain-needed
bogus-priv
dhcp-range=192.168.5.100,192.168.5.200,24h" >> /etc/dnsmasq.conf


# Install accesspoint command

echo "Installing accesspoint command..."

sudo wget https://gist.githubusercontent.com/brokenfloppydisk/78848b9ec7c67a9847ef8d5ac1dba15f/raw/bb135e9cc3b122227b4d1d3b1fbe86976859fc32/accesspoint.sh
sudo chmod +x accesspoint.sh
sudo mv ./accesspoint.sh /usr/local/bin/accesspoint

echo "Installation finished. Run accesspoint start to run the access point and run accesspoint stop to stop it."
echo "Reboot the system to finalize installation."