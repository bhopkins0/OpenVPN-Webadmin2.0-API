#!/bin/bash
apt install openvpn vnstat vnstati
(crontab -l ; echo "0 * * * * vnstati -vs -o /var/www/bwgraph.jpg") | crontab
