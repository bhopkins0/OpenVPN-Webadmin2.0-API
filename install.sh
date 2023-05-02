#!/bin/bash
apt install vnstat vnstati
(crontab -l ; echo "0 * * * * vnstati -vs -o /var/www/bwgraph.jpg") | crontab
vnstati -vs -o /var/www/bwgraph.jpg
