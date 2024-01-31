#!/bin/sh
#agregar usuario
useradd -m ticcol -s /bin/bash && echo "ticcol:T1CC0L2O!7" | chpasswd
usermod -aG sudo ticcol
sleep 5

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
echo "Instalador descargado"
sleep 5

#permitimos la instalacion
chmod a+x ooklaserver.sh
echo "Permisos concedidos"
sleep 5

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
sleep 5
