# raspberry-pi-router
TBD

# Setup
TBD
## Install Raspbian
No matter which transceiver module you use, you have to install *Raspbian* on your *Raspberry Pi*.
An instruction how to do that can be found [here](https://github.com/RIOT-Makers/wpan-raspbian/wiki/Create-a-generic-Raspbian-image-with-6LoWPAN-support#2-prepare-raspbian-image) and [here](https://www.raspberrypi.org/documentation/installation/installing-images/README.md).

After installing *Raspian* you have to enable the support for IEEE 802.15.4/LoWPAN devices.

Before enabling the support let's connect the transceiver to the *Raspberry Pi* in order to be able to test, if enabling the support was successful. 

## Connect Openlabs (AT86RF233) to Raspberry Pi
**Note**: Always shutdown the *Raspberry Pi* when you are dis-/connecting hardware from/to the *Raspberry Pi's* GPIOs.

**TODO**: Add image where to plug transceiver into *Raspberry Pi*

### Openlabs (AT86RF233)
To enable the support for IEEE 802.15.4/LoWPAN devices follow [this](https://github.com/RIOT-Makers/wpan-raspbian/wiki/Create-a-generic-Raspbian-image-with-6LoWPAN-support#33-enable-transceiver).

## Installation and Setup for Wifi-Hotspot, Router and 6LoWPAN
To install and setup all tools needed, just execute `./install.sh` in `<Projet-Root>/scripts/`. 

## Install Config Files
In order to avoid create/adjusting all the config files yourself you can just use the ones provided within this repository.

You do not even need to know where to put them, it is all done by [dotbot](https://github.com/anishathalye/dotbot).
You only need to execute following command in the root directory of this project, in order to copy the config files in the right directory: `sudo ./install`

**Note**: Be aware that there is a default password for the wlan hotspot in `etc/hostapd/hostapd.conf`-> Adjust the config file

# Known Issues
## Wifi and Radvd
1.  The Raspberry Pi does not get a global IPv6 address assigned by Radvd (this might be possible, but is not configured) ->     
    Add an IPv6 address by executing `sudo ip -6 addr add fd51:42f8:caae:d922::1/64 dev wlan0`
2.  When an `esp` connects with the Raspberry Pi via Wifi, no global IPv6 address is assigned automatically -> To trigger 
    assignment just remove the Pi's global IPv6 by executing `sudo ip -6 addr del fd51:42f8:caae:d922::1/64 dev wlan0` and 
    the readd it by executing `sudo ip -6 addr add fd51:42f8:caae:d922::1/64 dev wlan0` (the interface `wlan0` might be named 
    differently. check that with `ip link`).
