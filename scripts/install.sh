#!/usr/bin/env sh
#
# Description: Install useful tools and packages and all the install
#              scripts in this directory in correct order, in order to
#              setup the Raspberry Pi as a Wifi and 6LoWPAN Router.
#
# License    : MIT
# Author     : Matthias Bräuer <Matthias.Braeuer@haw-hamburg.de>
# Date       : 2019-10-16
#
#======================================================================================================================

# Downgrade Raspbian to kernel version 4.9.x, so that 6LoWPAN works properly.
#
# See: https://github.com/raspberrypi/linux/issues/2493#issuecomment-381648977 (2019-10-21)
# See: https://github.com/Hexxeh/rpi-firmware/commits/master (2019-10-21)
# See: https://forum-raspberrypi.de/forum/thread/21114-firmware-u-kernel-downgrade-mit-rpi-update/ (2019-10-21)
sudo rpi-update 936a8dc3a605c20058fbb23672d6b47bca77b0d5

# Useful when using the terminal
sudo apt install vim screen htop cmake

# Some Python add ons
sudo apt install virtualenv python-all-dev python-pip python3-pip

# Install wpan tools
./install-wpan-tools.sh

# Install systemd-lowpan
./install-systemd-lowpan.sh

# Setup Raspberry Pi as wifi hotspot
./setup-wifi-hotspot.sh

# Install aiocoap resource directory and coap client
# See: https://github.com/chrysn/aiocoap
git clone https://github.com/chrysn/aiocoap
cd aiocoap && pip3 install --upgrade ".[all]"

# Install radvd (a router advertisment router) in order to assign ip addresses automatically
sudo apt-get install radvd

