#!/bin/sh
#descargamos el instalador
cd /home/ticcol
wget https://install.speedtest.net/ooklaserver/ooklaserver.sh
sleep 5
echo "Instalador descargado"

#permitimos la instalacion
chmod a+x ooklaserver.sh
sleep 5
echo "Permisos concedidos"

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
