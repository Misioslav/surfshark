#!/usr/bin/sh
printf "%sdnameserver 162.252.172.57\nnameserver 149.154.159.92" > /etc/resolv.conf
printf "%s$USER\n$PASS" > /ovpn/surfshark_auth.txt

if [ $LOCATION = "LOCATION" ];
then
        ls -l /ovpn/ovpn-servers/*$MODE.ovpn | awk -F'[/.]' '{print "remote " $4"."$5"."$6".com "NETWORK}' >> /ovpn/servers2.txt
else
        ls -l /ovpn/ovpn-servers/$LOCATION*$MODE.ovpn | awk -F'[/.]' '{print "remote " $4"."$5"."$6".com "NETWORK}' >> /ovpn/servers2.txt
fi
awk 'NR>=1 && NR<=64' /ovpn/servers2.txt > /ovpn/servers.txt
sed '3r /ovpn/servers.txt' /ovpn/template.ovpn > /ovpn/servers.ovpn
openvpn --config /ovpn/servers.ovpn --auth-user-pass /ovpn/surfshark_auth.txt
rm /ovpn/*.txt
rm /ovpn/servers.ovpn
exec "$@"
