#!/usr/bin/env sh
#
# Description : Install the systemd lowpan tool in order to set
#               up the lowpan device automatically on startup.
#               For more information see https://github.com/RIOT-Makers/wpan-raspbian/wiki/Spice-up-Raspbian-for-the-IoT#systemd-lowpan
#               (2019-10-16)
#
# License     : MIT
# Author      : Matthias Bräuer <Matthias.Braeuer@haw-hamburg.de>
# Date        : 2019-10-16
#
#==============================================================================

# Clone systemd lowpan tool
sudo mkdir -p /opt/src
sudo chown pi /opt/src
cd /opt/src
git clone https://github.com/riot-makers/wpan-raspbian
cd wpan-raspbian

# Copy some helper (shell) to a well-known location
sudo cp -r usr/local/sbin/* /usr/local/sbin/.
sudo chmod +x /usr/local/sbin/*

# Copy files for systemd integration
sudo cp etc/default/lowpan /etc/default/.
sudo cp etc/systemd/system/lowpan.service /etc/systemd/system/.

# Enable lowpan service
sudo systemctl enable lowpan.service

# Start lowpan service
sudo systemctl start lowpan.service

# List all avalable network interfaces (You should see a lowpan0 and wpan0 device)
ip link

