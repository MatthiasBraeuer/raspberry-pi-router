#===================================================================================
#
# Description: This script installs the WPAN tools. For more information checkout
#              https://github.com/RIOT-Makers/wpan-raspbian/wiki/Create-a-generic-Raspbian-image-with-6LoWPAN-support#5-install-wpan-tools-and-configure-6lowpan-devices
#              (2019-10-16)
# 
# Author     : Matthias Bräuer <Matthias.Braeuer@haw-hamburg.de>
# Date       : 2019-10-16
#
#===================================================================================
# Clone wpan-tools repository
sudo apt install git
sudo mkdir /opt/src
sudo chown pi /opt/src
cd /opt/src
git clone https://github.com/linux-wpan/wpan-tools

# Install some dependencies and packages for installing the wpan-tools
sudo apt install dh-autoreconf libnl-3-dev libnl-genl-3-dev

# Configure the wpan-tools
cd /opt/src/wpan-tools
./autogen.sh
./configure CFLAGS='-g -O0' --prefix=/usr --sysconfdir=/etc --libdir=/usr/lib

# Build and install the wpan-tools
make
sudo make install

# Check if it was successful
iwpan list

