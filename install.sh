#!/bin/bash -e

echo "Backhaul Script"

if [ "$EUID" -ne 0 ]
then echo "Please run as root."
exit
fi

CHS=3
