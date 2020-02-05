![Logo](https://github.com/BitCurator/bitcurator.github.io/blob/master/logos/BitCurator-Basic-400px.png)

# bitcurator-distro-installer
Install script for the BitCurator distro tools and configuration files

[![GitHub issues](https://img.shields.io/github/issues/bitcurator/bitcurator-distro-installer.svg)](https://github.com/bitcurator/bitcurator-distro-installer/issues)
[![GitHub forks](https://img.shields.io/github/forks/bitcurator/bitcurator-distro-installer.svg)](https://github.com/bitcurator/bitcurator-distro-installer/network)
[![Twitter Follow](https://img.shields.io/twitter/follow/bitcurator.svg?style=social&label=Follow)](https://twitter.com/bitcurator)

This repo provides a simple bash script to download the relevant components and build the BitCurator environment in Ubuntu 18.04LTS using the salt states and supporting files provided by https://github.com/bitcurator/bitcurator-distro-salt.

Visit https://github.com/BitCurator/bitcurator-distro/wiki/Releases to download the latest official release!

## Pre-Installation Steps

Create a fresh Ubuntu 18.04LTS environment in a VM or on a dedicated host. Official releases are created with the hostname **bitcurator** and the username **bcadmin**, but you may use any desired hostname and username. Log in and execute the following in a terminal:

```shell
sudo apt-get update
sudo apt-get dist-upgrade
sudo apt install git
```

## Simple install

You can install all of the BitCurator tools and desktop support files for any user with our dedicated installation script. First, run the following in a terminal:

```shell
git clone https://github.com/bitcurator/bitcurator-distro-installer
cd bitcurator-distro-installer
```

To install the latest release of BitCurator, run the following, replacing "username" with the username of an existing user. Note! The installation may take an hour or longer to complete.

```shell
sudo ./install.sh -u username
```

If you would like to install a specific (older) release, you can specify a release tag during installation:
```shell
sudo ./install.sh -u username -t vX.X.X
```

where "vX.X.X" is one of the releases listed at https://github.com/BitCurator/bitcurator-distro-salt/releases.

## BitCurator documentation, help, and other information

User documentation and additional resources are available on
[the BitCurator Environment wiki](https://confluence.educopia.org/display/BC).

Questions and comments can also be directed to the bitcurator-users list.

[https://groups.google.com/d/forum/bitcurator-users](https://groups.google.com/d/forum/bitcurator-users)

## License(s)

The BitCurator logo, BitCurator project documentation, and other non-software products of the BitCurator team are subject to the the Creative Commons Attribution 4.0 Generic license (CC By 4.0).

Unless otherwise indicated, software items in this repository are distributed under the terms of the GNU General Public License v3.0. See the LICENSE file for additional details.

In addition to software produced by the BitCurator team, BitCurator packages and modifies open source software produced by other developers. Licenses and attributions are retained here where applicable.

## Development Team and Support

The BitCurator environment is a product of the BitCurator team housed at the School of Information and Library Science at the University of North Carolina at Chapel Hill. Funding between 2011 and 2014 was provided by the Andrew W. Mellon Foundation.

Ongoing support for the BitCurator environment is managed by the BitCurator Consortium. Find out more at:

http://www.bitcuratorconsortium.net/


