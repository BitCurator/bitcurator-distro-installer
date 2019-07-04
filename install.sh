#!/bin/bash

#--- FUNCTION ---------------------------------------------------------
# NAME: echoinfo
# DESCRIPTION: Echo information to stdout.
#----------------------------------------------------------------------
echoinfo() {
    printf "%s * STATUS%s: %s\n" "${GC}" "${EC}" "$@";
}

if [[ $EUID -ne 0 ]]; then
   echo "This script must be run with sudo"
   exit 1
fi

echoinfo " ***********************************************************"
echoinfo "                                                            "
echoinfo " BitCurator provides desktop customizations (desktop folder "
echoinfo " icons, an appindicator to disable USB write access, and a  "
echoinfo " custom background) for an existing user. Please enter the  "
echoinfo " username now.                                              "
echoinfo "                                                            "
echoinfo " ***********************************************************"
echoinfo "                                                            "

read -p " Enter username: " USERID

echoinfo " Installing git..."
apt-get install -y git

echoinfo " Installing salt..."
apt-get install -y salt-minion
service salt-minion stop

echoinfo " Getting latest BitCurator release files..."
git clone https://github.com/bitcurator/bitcurator-distro-salt /srv/salt
cd /srv/salt
git checkout ENHANCEMENT-install

echoinfo " Installing BitCurator tools and scripts..."
salt-call -l info --local state.sls bitcurator.primary pillar='{"bitcurator_version": "dev", "bitcurator_user": '$USERID'}'


