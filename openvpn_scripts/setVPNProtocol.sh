#!/usr/bin/bash
sed -i "s/proto.*/proto $1/" /etc/openvpn/server.conf
sed -i "s/proto .*/proto $1/" /etc/openvpn/client-template.txt


if grep -q "^explicit-exit-notify$" "/etc/openvpn/client-template.txt"; then
  if [ "$1" = "tcp" ]; then
    sed -i "s/^explicit-exit-notify$/#&/" "/etc/openvpn/client-template.txt"
  fi
fi

if grep -q "^#explicit-exit-notify$" "/etc/openvpn/client-template.txt" && [ "$1" = "udp" ]; then
    sed -i "s/^#explicit-exit-notify$/explicit-exit-notify/" "/etc/openvpn/client-template.txt"
else
  if [ "$1" = "udp" ]; then
    echo "explicit-exit-notify" >> "/etc/openvpn/client-template.txt"
  fi
fi



service openvpn restart
echo true
