#!/bin/sh
#descargamos el instalador
wget https://install.speedtest.net/ooklaserver/ooklaserver.sh

#permitimos la instalacion
chmod a+x ooklaserver.sh

#instalamos el servidor speedtest
./ooklaserver.sh install

#iniciamos el server
./ooklaserver.sh start

#Agregamos el iniciador automatico
cd /etc/systemd/system
wget https://raw.githubusercontent.com/viejojavi/ooklaserver/main/OoklaServer.service
systemctl enable OoklaServer.service
systemctl start OoklaServer.service
sleep 5
echo "SERVIDOR SPEEDTEST FUNCIONAL"
