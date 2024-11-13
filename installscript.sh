#!/bin/bash

if [[ $EUID -eq 0 ]]; then
  echo "This script is running with root privileges."
else 
  echo "This script is not running with root privileges. RUN IT WITH SUDO!!!"
  exit 1
fi

apt update
apt full-upgrade

apt install -y sddm
apt install -y kde-plasma-desktop xorg dbus-x11

unset SESSION_MANAGER
unset DBUS_SESSION_BUS_ADDRESS

exec startplasma-x11 &
