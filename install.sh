#!/bin/bash -e

echo
echo "Backhaul Script"
echo
sleep 1

DIRECTORY="/etc/cluster"
CHS=3
serviceName="cluster"

#echo "Enter service name:"
#echo "your service name is: $erviceName"
backhaul_instller() {
if [ -d "$DIRECTORY" ]; then
  echo "$DIRECTORY does exist."
fi

if [ ! -d "$DIRECTORY" ]; then
  mkdir -p /etc/cluster
fi

wget --inet4-only wget -P "$DIRECTORY" "https://github.com/Musixal/Backhaul/releases/latest/download/backhaul_linux_amd64.tar.gz"
tar -xzf "$DIRECTORY/backhaul_linux_amd64.tar.gz" -C "$DIRECTORY"
rm $DIRECTORY/LICENSE $DIRECTORY/README.md $DIRECTORY/backhaul_linux_amd64.tar.gz
mv $DIRECTORY/backhaul $DIRECTORY/$serviceName
}

echo "Select Server Location:"
echo "1.Iran"
echo "2.kharej"
echo "3.Exit"
read -r -p "Select Number(Default is: 3):" CHS

case $CHS in
    1)  echo "Be carefull SSH port must under 23"
    echo "Enter service name:"
    read serviceName
    
    *)   echo "Done."; exit 1 ;;

esac
