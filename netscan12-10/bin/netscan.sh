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
    17)
        escaneo17 $1 $2 $3
        ;;
    18)
        escaneo18 $1 $2 $3
        ;;
    19)
        escaneo19 $1 $2 $3
        ;;
    20)
        escaneo20 $1 $2 $3
        ;;
    21)
        escaneo21 $1 $2 $3
        ;;
    22)
        escaneo22 $1 $2 $3
        ;;
    23)
        escaneo23 $1 $2 $3
        ;;
    24)
        escaneo24 $1 $2 $3
        ;;
    25)
    	escaneo25 $1 $2 $3
    	;;
    26)
    	escaneo26 $1 $2 $3
    	;;
    27)
    	escaneo27 $1 $2 $3
    	;;
    28)
    	escaneo28 $1 $2 $3
    	;;
    29)
    	escaneo29 $1 $2 $3
    	;;
    30)
        escaneo30 $1 $2 $3
        ;;
    *)echo "/"$netmask "netmask is not a valid parameter"
esac
