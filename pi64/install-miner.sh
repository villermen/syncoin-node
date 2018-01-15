#!/bin/bash

if [[ $EUID -ne 0 ]]; then
    echo "You must run this script as root, sudo up mate."
    exit 1
fi

apt-get update --yes
apt-get dist-upgrade --yes
apt-get install git --yes

su pi -c "git clone https://github.com/villermen/syncoin-node.git /home/pi/syncoin-node"

cat <<EOF > /etc/systemd/system/syncoind.service
[Unit]
Description=SynCoin miner deamon

[Service]
User=pi
ExecStart=/bin/bash -c "cd /home/pi/syncoin-node && git pull && ./run.sh --mine"

[Install]
WantedBy=multi-user.target
EOF

systemctl daemon-reload
systemctl enable syncoind.service
systemctl start syncoind.service

