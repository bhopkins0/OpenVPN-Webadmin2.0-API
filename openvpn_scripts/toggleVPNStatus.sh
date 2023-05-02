#!/bin/bash

if service openvpn status | grep -q " Active: active"; then
    service openvpn stop
else
    service openvpn start
fi
