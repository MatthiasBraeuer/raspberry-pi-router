#!/usr/bin/env sh
#
# Description: Setup the Raspberry Pi as a Wifi hotspot.
#              See https://www.raspberrypi.org/documentation/configuration/wireless/access-point.md
#              (2019-10-16)
#
# License    : MIT
# Author     : Matthias Bräuer <Matthias.Braeuer@haw-hamburg.de>
# Date       : 2019-10-16
#
#==============================================================================

# Install tools for wifi hotspot
sudo apt install dnsmasq hostapd

# Disable services since the config files are not installed yet
sudo systemctl stop dnsmasq
sudo systemctl stop hostapd

# Backup old dnsmasq.conf
sudo mv /etc/dnsmasq.conf /etc/dnsmasq.conf.orig

# Enable hostapt
sudo systemctl unmask hostapd
sudo systemctl enable hostapd

# Add routing and masquerade (Use iptables-legacy,
# otherwise the chain MASQUERADE does not exist).
sudo iptables-legacy -t nat -A  POSTROUTING -o eth0 -j MASQUERADE
sudo sh -c "iptables-legacy-save > /etc/iptables.ipv4.nat"
iptables-legacy-restore < /etc/iptables.ipv4.nat

