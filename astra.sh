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

#Instalar Drivers TBS
sudo su
apt install curl
curl https://raw.githubusercontent.com/chacal1231/CursoIPTV/main/Driver-TBS.sh | bash

#Cambian el modo de la TBS SAT
echo "options stid135 mode=1" > /etc/modprobe.d/stid135.conf

#Validar TBS
ls /dev/dvb
sleep 5

#Instalar Astra
curl -Lo /usr/bin/astra https://cesbo.com/astra-latest
chmod +x /usr/bin/astra

# Habilitar para cambiar puerto
# astra init 45000
systemctl enable astra
systemctl start astra

#Instalar Oscam
apt-get update
apt-get -y install subversion dialog
svn co http://svn.speedbox.me/svn/oscam-install/trunk oscam
chmod -R 0755 oscam
cd oscam
./install.sh

#Reiniciar
reboot
