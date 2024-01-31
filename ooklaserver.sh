#!/bin/sh
#Cabecera
chmod -x /etc/update-motd.d/*
cd /etc/update-motd.d
rm 00-header
wget https://raw.githubusercontent.com/viejojavi/header/main/00-header
chmod +x 00-header
echo "Header Listo"
sleep 5

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
sleep 5

#Agregamos el iniciador automatico
cd /etc/systemd/system
rm OoklaServer.service
wget https://raw.githubusercontent.com/viejojavi/ooklaserver/main/OoklaServer.service
systemctl daemon-reload
systemctl enable OoklaServer.service
systemctl start OoklaServer.service
sleep 5
echo "
################################

SERVIDOR SPEEDTEST FUNCIONAL
Instalador creado por Oscar Castillo
Consultor de Telecomunicaciones
Contacto: (+57) 3007081170

################################"
