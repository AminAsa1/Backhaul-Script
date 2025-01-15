#!/bin/bash -e

echo
echo "Backhaul Script"
echo
sleep 1

DIRECTORY="/etc/cluster"
CHS=3
serviceName="cluster"
PORT=2052
#TOPASS=10100

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

server_config() {
cat >$DIRECTORY/$serviceName.toml <<-EOF
[server]
bind_addr = "0.0.0.0:$PORT"
transport = "tcpmux"
token = "X9%Sx,2bB'4t"
keepalive_period = 75
nodelay = true
heartbeat = 40
channel_size = 2048
mux_con = 8
mux_version = 1
mux_framesize = 32768
mux_recievebuffer = 4194304
mux_streambuffer = 65536
sniffer = false
ports = [
"10010=127.0.0.1:80"
]
EOF
}
service_config() {
cat >/etc/systemd/system/$serviceName.service <<-EOF
[Unit]
Description=Cluster game Service01
After=network.target

[Service]
Type=simple
ExecStart=$DIRECTORY/$serviceName -c $DIRECTORY/$serviceName.toml
Restart=always
RestartSec=3
LimitNOFILE=1048576

[Install]
WantedBy=multi-user.target
EOF
systemctl daemon-reload
systemctl --now enable $serviceName.service
systemctl start $serviceName.service
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
    echo "Enter tunnel port:"
    read PORT
    backhaul_instller
    server_config
    service_config
    
 exit ;;
   *)   echo "Done."; exit 1 ;;

esac
