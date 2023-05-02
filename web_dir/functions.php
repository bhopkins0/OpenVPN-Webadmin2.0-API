<?php
function getServerStatus()
{
    return shell_exec("service openvpn status");
}

function getBandwidthGraph()
{
    return shell_exec("base64 -w 0 /var/www/bwgraph.jpg");
}

function getConnectedClients()
{
     return shell_exec("sudo /var/www/returnConnectedClients.sh");
}

function createClient($clientName)
{
     return shell_exec("sudo /var/www/createClient.sh $clientName");
}

function deleteClient($clientName)
{
     $deleteClient = shell_exec("sudo /var/www/deleteClient.sh $clientName");
     return str_contains($deleteClient, "Revocation was successful.");
}

function getClientTemplate()
{
     return shell_exec("sudo /var/www/returnClientTemplate.sh");
}

function setVPNPort($port, $ip)
{
     return shell_exec("sudo /var/www/setVPNPort.sh $port $ip");
}

function setVPNProtocol($protocol)
{
     return shell_exec("sudo /var/www/setVPNProtocol.sh $protocol");
}

function setVPNDNS($dns)
{
     return shell_exec("sudo /var/www/setVPNDNS.sh $dns");
}

function toggleVPNStatus()
{
     return shell_exec("sudo /var/www/toggleVPNStatus.sh");
}
