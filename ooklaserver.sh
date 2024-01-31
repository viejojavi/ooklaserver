#!/bin/sh
#Reviso si el directorio existe
if [ -d "/etc/systemd/system" ] 
then
    if [ -f "/etc/systemd/system/OoklaServer.service" ];
    then
    	[Unit] 
 		Description=OoklaServer start  
 		After=network.target
  
	[Service] 
		User=root 
 		ExecStart=/home/ticcol/OoklaServer 
  
 	[Install] 
 		WantedBy=multi-user.target
    	systemctl enable OoklaServer.service
 	sleep 5
	systemctl start OoklaServer.service
    fi
else
	[Unit] 
 		Description=OoklaServer start  
 		After=network.target
  
	[Service] 
		User=root 
 		ExecStart=/home/ticcol/OoklaServer 
  
 	[Install] 
 		WantedBy=multi-user.target
    	systemctl enable OoklaServer.service
 	sleep 5
	systemctl start OoklaServer.service
fi
