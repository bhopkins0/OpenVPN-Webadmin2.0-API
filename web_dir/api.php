<?php
include 'config.php';
include 'functions.php';

if ($_POST["apikey"] != $apiKey)
    die("false");

if ($_POST["action"] == "status")
    echo getServerStatus();

if ($_POST["action"] == "bwgraph")
    echo getBandwidthGraph();

if ($_POST["action"] == "connectedclients")
    echo getConnectedClients();

if ($_POST["action"] == "createclient")
    echo createClient($_POST["clientName"]);

if ($_POST["action"] == "getclienttemplate")
    echo getClientTemplate();

if ($_POST["action"] == "deleteclient")
    echo deleteClient($_POST["clientName"]) ? 'true' : 'false';

if ($_POST["action"] == "setvpnport")
    echo setVPNPort($_POST["vpnPort"], $_POST["setIP"]) ? 'true' : 'false';

if ($_POST["action"] == "setvpnprotocol")
    echo setVPNProtocol($_POST["vpnProtocol"]) ? 'true' : 'false';

if ($_POST["action"] == "setvpndns")
    echo setVPNDNS($_POST["vpnDNS"]) ? 'true' : 'false';

if ($_POST["action"] == "toggleserverstatus")
    toggleVPNStatus();
