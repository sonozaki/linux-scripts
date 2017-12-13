#!/bin/bash

<<LICENSE
  Copyright (C) 2017 Francisco Domínguez Lerma [francisco.dominguez.lerma@gmail.com]

  This program is free software: you can redistribute it and/or modify
  it under the terms of the GNU General Public License as published by
  the Free Software Foundation, either version 3 of the License, or
  (at your option) any later version.

  This program is distributed in the hope that it will be useful,
  but WITHOUT ANY WARRANTY; without even the implied warranty of
  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  GNU General Public License for more details.

  You should have received a copy of the GNU General Public License
  along with this program.  If not, see <http://www.gnu.org/licenses/>.
LICENSE

<<INSTRUCCIONES

SIMPLE SCRIPT IPTABLES PARA USO EN ESCRITORIO

CONTIENE REGLAS MUY SENCILLAS Y RESTRICTIVAS PENSADAS PARA UN ORDENADOR DE ESCRITORIO
POR DEFECTO NINGÚN PUERTO ESTÁ ABIERTO, NI SIQUIERA ES CAPAZ DE DEVOLVER PING

#################################
########## INSTALACIÓN ##########
#################################

1.- Cambia el contenido de la variable "iptables_path" para que apunte al binario de iptables en tu distribución GNU/Linux (cambia dependiendo de la distro)
2.- Coloca el script donde desees, recomiendo colocarlo en "/etc/fw.sh"
3.- Dale permisos de ejecución al script con "chmod +x /etc/fw.sh"
4.- Añade el script al inicio con cron, para ello puedes utilizar la herramienta "crontab", añadiendo "@reboot /etc/fw.sh"
5.- Reinicia
6.- Puedes comprobar que las reglas están activas con un simple "iptables -L", además verás que no devuelve ping a otros equipos dentro de la red
INSTRUCCIONES

iptables_path=""

if [ -z "$iptables_path" ]
then
	echo "Necesitas configurar la ruta de iptables en la variable iptables_path"
	exit
fi

if [ -f $iptables_path ]
then

$iptables_path -P INPUT DROP

$iptables_path -A INPUT -i lo -j ACCEPT
$iptables_path -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT

else

echo "La ruta de iptables está mal configurada, asegurate de que la variable iptables_path apunta al binario de iptables"

fi
