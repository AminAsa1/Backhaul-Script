#!/bin/bash -e

echo
echo "Backhaul Script"
echo
sleep 1

DIRECTORY="/etc/cluster"

echo "Enter service name:"
read serviceName

echo "your service name is: $erviceName"

if [ -d "$DIRECTORY" ]; then
  echo "$DIRECTORY does exist."
fi

if [ ! -d "$DIRECTORY" ]; then
  mkdir -p /etc/cluster
fi

wget --inet4-only wget -P "$DIRECTORY" "https://github.com/Musixal/Backhaul/releases/latest/download/backhaul_linux_amd64.tar.gz"
