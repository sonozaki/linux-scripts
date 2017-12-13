# Simple script iptables para desktop

Este pequeño script es muy útil para configurar un cortafuegos con iptables para desktop, este firewall sólo contiene tres reglas muy sencillas y restrictivas, básicamente, no permite ninguna entrada de datos ni forwarding en nuestro equipo, ten en cuenta que con este script, ningún servicio podrá "escuchar" detrás de un puerto.

Las reglas iptables utilizadas en este script son:

```
$iptables_path -P INPUT DROP

$iptables_path -A INPUT -i lo -j ACCEPT
$iptables_path -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
```

# Instalación

1.- Cambia el contenido de la variable "iptables_path" para que apunte al binario de iptables en tu distribución GNU/Linux (cambia dependiendo de la distro)

2.- Coloca el script donde desees, recomiendo colocarlo en "/etc/fw.sh"

3.- Dale permisos de ejecución al script con "chmod +x /etc/fw.sh"

4.- Añade el script al inicio con cron, para ello puedes utilizar la herramienta "crontab", añadiendo "@reboot /etc/fw.sh"

5.- Reinicia

6.- Puedes comprobar que las reglas están activas con un simple "iptables -L", además verás que no devuelve ping a otros equipos dentro de la red