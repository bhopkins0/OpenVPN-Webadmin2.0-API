#!/usr/bin/bash
sed -i "s/port.*/port $1/" /etc/openvpn/server.conf
sed -i "s/remote .*/remote $2 $1/" /etc/openvpn/client-template.txt
service openvpn restart
echo true
