#!/bin/bash
horaInicial=$(date +%s)
minutos=0
horas=0
#######Situa en la siguiente linea el script
cd /opt/netscan/bin/
script=$(echo $1 | tr '/' ' ' | awk '{print$4}')

if [ -z $2 ]; then
	./$script
fi
if [ -z $3 ]; then
	./$script $2
fi
if [ "$3" == "-O" ]; then
	./$script $2 $3
fi

horaFinal=$(date +%s)
segundos=$(($horaFinal-$horaInicial))

while true; do

	if [ $segundos -gt 60 ]; then

		segundos=$(($segundos-60))
		minutos=$(($minutos+1))

	fi

	if [ $minutos -gt 60 ]; then

		minutos=$(($minutos-60))
		horas=$(($horas+1))

	fi

	echo $horas' horas, '$minutos' minutos y '$segundos' segundos'

	exit 1

done
