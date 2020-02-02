#!/bin/bash

# Installer for tools included with BitCurator. BitCurator also 
# provides desktop customizations (desktop folder icons, an appindicator 
# to disable USB write access, and a custom background) for an existing 
# user.

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

USERID=root

# Minimal request does nothing right now, as main install
# is the same as minimal install
while getopts ":u:" opt; do
  case ${opt} in
    u )
      USERID=${OPTARG}
      ;;
    \? ) 
      echo "Usage: install.sh -u username"
      ;;
  esac
done
shift $((OPTIND -1))

if [ "$USERID" == "root" ];
then
  echo "No username supplied, or username root not allowed."
  exit 1
fi

echoinfo " Installing git..."
apt-get install -y git

echoinfo " Installing salt..."
apt-get install -y salt-minion
service salt-minion stop

echoinfo " Getting latest BitCurator release files..."
git clone https://github.com/bitcurator/bitcurator-distro-salt /srv/salt

echoinfo " Installing BitCurator tools and scripts..."
salt-call -l info --local state.sls bitcurator.primary pillar='{"bitcurator_version": "dev", "bitcurator_user": '$USERID'}'


