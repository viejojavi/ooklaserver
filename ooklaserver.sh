#!/bin/sh
#descargamos el instalador
cd /home/ticcol
rm ooklaserver.sh
sleep 2
wget https://install.speedtest.net/ooklaserver/ooklaserver.sh
sleep 5
echo "Instalador descargado"

#permitimos la instalacion
chmod a+x ooklaserver.sh
sleep 5
echo "Permisos concedidos"

#instalamos el servidor speedtest
./ooklaserver.sh install -f

#iniciamos el server
./ooklaserver.sh start

#Creamos el daemon
./OoklaServer --daemon
echo "Demonio Instalado"

#Agregamos el iniciador automatico
cd /etc/systemd/system
rm OoklaServer.service
wget https://raw.githubusercontent.com/viejojavi/ooklaserver/main/OoklaServer.service
systemctl enable OoklaServer.service
systemctl start OoklaServer.service
sleep 5
echo "SERVIDOR SPEEDTEST FUNCIONAL"
