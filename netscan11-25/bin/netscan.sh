#!/bin/bash
if [ "$1" == "-I" ]; then
    cat "$(find /opt/ -name installed.txt 2>/dev/null)"
    exit 1
fi
if [ "$1" == "-help" ]; then
    exit 1
fi
if [ -z $1 ] || [ "$1" == "-T" ] || [ "$1" == "--time" ] || [ "$1" == "-O" ] || [ "$1" == "-N" ]; then
    echo '[netscan error]: There is not an IP address.'
    exit 1
fi

if [ "$1" == "-h" ] || [ "$1" == "--help" ] || [ "$1" == "-H" ]; then
    cat "$(find /opt/ -name ayuda-escaneo.txt 2>/dev/null)"
    exit 1
fi

read -p "Insert the netmask [16-30]: " netmask
case $netmask in

    16)
        escaneo16 $1 $2 $3
        ;;
    24)
        escaneo24 $1 $2 $3
        ;;
#    18)
#        echo "Hola 18"
#        ;;
    *)echo "/"$netmask "netmask is not a valid parameter"
esac
