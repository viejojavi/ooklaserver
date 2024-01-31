#!/bin/sh
cd /etc/systemd/system
wget https://raw.githubusercontent.com/viejojavi/ooklaserver/main/OoklaServer.service
systemctl enable OoklaServer.service
systemctl start OoklaServer.service
