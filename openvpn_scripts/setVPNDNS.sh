#!/bin/bash
sed -i '/dhcp-option DNS/d' /etc/openvpn/server.conf
echo "push \"dhcp-option DNS $1\"" >> /etc/openvpn/server.conf
service openvpn restart
echo true
