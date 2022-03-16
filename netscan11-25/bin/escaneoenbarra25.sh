#!/bin/bash
ip1=$(echo $1 | tr '.' ' ' | awk '{print$1}')
ip2=$(echo $1 | tr '.' ' ' | awk '{print$2}')
ip3=$(echo $1 | tr '.' ' ' | awk '{print$3}')
ip4=$(echo $1 | tr '.' ' ' | awk '{print$4}')
ip=$ip1.$ip2.$ip3.$ip4
