# OpenVPN-Webadmin2.0-API
OpenVPN Webadmin 2.0 API Endpoint

This endpoint is needed for OpenVPN Webadmin 2.0 for Ubuntu 22.04

How to use:

0. Set up OpenVPN with this script: https://github.com/angristan/openvpn-install
2. Set up a domain and webserver with PHP on the VPN server
3. Add the server to the OpenVPN Webadmin
4. Add the files in `web_dir` to your web directory
5. Set the API key in the `config.php` file
6. Add the files in `openvpn_scripts` to `/var/www/` and give executable permissions (`chmod +x file_name`)
8. Enter the command `visudo` and add these lines:

```
www-data ALL=(root) NOPASSWD: /var/www/returnConnectedClients.sh
www-data ALL=(root) NOPASSWD: /var/www/createClient.sh
www-data ALL=(root) NOPASSWD: /var/www/returnClientTemplate.sh
www-data ALL=(root) NOPASSWD: /var/www/deleteClient.sh
www-data ALL=(root) NOPASSWD: /var/www/setVPNPort.sh
www-data ALL=(root) NOPASSWD: /var/www/setVPNProtocol.sh
www-data ALL=(root) NOPASSWD: /var/www/setVPNDNS.sh
www-data ALL=(root) NOPASSWD: /var/www/toggleVPNStatus.sh
```
8. Run `install.sh`

