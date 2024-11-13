#!/bin/bash

if sudo -v 2>&1 > /dev/null; then
  echo "This script is running with sudo privileges."
else
  echo "This script is not running with sudo privileges. Bruh"
  exit 1
fi

apt update
apt full-upgrade

unset SESSION_MANAGER
unset DBUS_SESSION_BUS_ADDRESS

exec startplasma-x11 &