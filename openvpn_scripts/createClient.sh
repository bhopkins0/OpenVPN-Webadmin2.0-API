#!/usr/bin/bash
function newClient() {
        CLIENTEXISTS=$(tail -n +2 /etc/openvpn/easy-rsa/pki/index.txt | grep -c -E "/CN=$1\$")
        if [[ $CLIENTEXISTS == '1' ]]; then
                echo "false"
                exit
        else
                cd /etc/openvpn/easy-rsa/ || return
                echo yes | ./easyrsa build-client-full "$1" nopass >/dev/null
        fi
                echo "<ca>"
                cat "/etc/openvpn/easy-rsa/pki/ca.crt"
                echo "</ca>"
                echo "<cert>"
                awk '/BEGIN/,/END/' "/etc/openvpn/easy-rsa/pki/issued/$1.crt"
                echo "</cert>"
                echo "<key>"
                cat "/etc/openvpn/easy-rsa/pki/private/$1.key"
                echo "</key>"
                echo "<tls-crypt>"
                cat /etc/openvpn/tls-crypt.key
                echo "</tls-crypt>"
        exit 0
}

newClient $1
