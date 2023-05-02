#!/usr/bin/bash
function deleteClient() {
        cd /etc/openvpn/easy-rsa/ || return
        ./easyrsa --batch revoke "$1"
        EASYRSA_CRL_DAYS=3650 ./easyrsa gen-crl
        rm -f /etc/openvpn/crl.pem
        cp /etc/openvpn/easy-rsa/pki/crl.pem /etc/openvpn/crl.pem
        chmod 644 /etc/openvpn/crl.pem
        sed -i "/^$1,.*/d" /etc/openvpn/ipp.txt
        cp /etc/openvpn/easy-rsa/pki/index.txt{,.bk}
        sed -i -e '/^[R]/d' /etc/openvpn/easy-rsa/pki/index.txt
}

deleteClient $1
