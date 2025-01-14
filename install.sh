#!/bin/bash -e

if [ "$EUID" -ne 0 ]
then echo "Please run as root."
exit
fi

CHS=3
