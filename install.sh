#!/bin/bash -e

echo
echo "Backhaul Script"
echo
sleep 1

DIRECTORY="/etc/cluster"

echo "Enter service name:"
read serviceName

if [ -d "$DIRECTORY" ]; then
  echo "$DIRECTORY does exist."
fi
