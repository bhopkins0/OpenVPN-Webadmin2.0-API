#!/usr/bin/bash
sed -n '/Connected Since/,/ROUTING TABLE/{/Connected Since/b;/ROUTING TABLE/b;p}' /var/log/openvpn/status.log
