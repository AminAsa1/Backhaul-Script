#!/bin/bash -e

echo
echo "Backhaul Script"
echo
sleep 1

DIRECTORY="/etc/cluster"

echo "Enter service name:"
read serviceName

echo "$DIRECTORY"
echo "$erviceName"
echo "Hi, Im Hasan, What is your name ?"
if [ -d "$DIRECTORY" ]; then
  echo "$DIRECTORY does exist."
fi

if [ ! -d "$DIRECTORY" ]; then
  echo "$DIRECTORY does not exist."
fi
