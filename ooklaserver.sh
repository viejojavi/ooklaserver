#!/bin/sh
#descargamos el instalador
wget https://install.speedtest.net/ooklaserver/ooklaserver.sh
sleep 5
echo "Instalador descargado"

#permitimos la instalacion
sudo chmod a+x ooklaserver.sh
sleep 5
echo "Permisos concedidos"

#instalamos el servidor speedtest
sudo ./ooklaserver.sh install

#iniciamos el server
./ooklaserver.sh start

#Agregamos el iniciador automatico
cd /etc/systemd/system
wget https://raw.githubusercontent.com/viejojavi/ooklaserver/main/OoklaServer.service
sudo systemctl enable OoklaServer.service
sudo systemctl start OoklaServer.service
sleep 5
echo "SERVIDOR SPEEDTEST FUNCIONAL"
