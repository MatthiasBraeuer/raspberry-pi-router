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
#==============================================================================

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

