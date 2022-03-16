#!/bin/bash
ip1=$(echo $1 | tr '.' ' ' | awk '{print$1}')
ip2=$(echo $1 | tr '.' ' ' | awk '{print$2}')
ip3=$(echo $1 | tr '.' ' ' | awk '{print$3}')
ip4=$(echo $1 | tr '.' ' ' | awk '{print$4}')
ip=$ip1.$ip2.$ip3.$ip4
if [ "$2" == '-T' ] || [ "$2" == '--time' ] && [ -z $3 ]; then
    tiempo "$(find /opt/ -name escaneoenbarra16.sh 2>/dev/null)" $ip
    exit 1
fi
if [ "$2" == '-T' ] || [ "$2" == '--time' ] || [ "$3" == '-T' ] || [ "$3" == '--time' ] && [ "$2" == "-O" ] || [ "$3" == "-O" ]; then
    tiempo "$(find /opt/ -name escaneoenbarra16.sh 2>/dev/null)" $ip "-O"
    exit 1
fi

if [ "$1" == "-h" ] || [ "$1" == "--help" ] || [ "$1" == "-H" ]; then
    cat "$(find /opt/ -name ayuda-escaneo.txt 2>/dev/null)"
    exit 1
fi
ip4=$(($ip4+1))
while true; do
	ip=$ip1.$ip2.$ip3.$ip4
	recibidos=$(ping -c 1 -n -W 0.2 $ip | grep received | awk '{print$4}')
	if [ $recibidos -eq 1 ]; then
		if [ "$2" == "-O" ]; then
		ttl=$(ping -c 1 -n -W 0.2 $ip | grep "ttl" | awk '{print$6}' | sed 's/ttl=//')
        if [ $ttl -le 64 ] && [ $ttl -ge 0 ]; then
                echo $ip '-> Linux OS'
        fi
        if [ $ttl -ge 65 ] && [ $ttl -le 128 ]; then
                echo $ip '-> Windows OS'
        fi
        else
        echo $ip
        fi
	fi
    if [ $ip3 -eq "255" ] && [ $ip4 -eq "255" ]; then
        exit 1
    fi
    if [ "$ip4" == "255" ]; then
        ip4=0
        ip3=$(($ip3+1))
    fi
#	echo $ip
	ip4=$(($ip4+1))
done
