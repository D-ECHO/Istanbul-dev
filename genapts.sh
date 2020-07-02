#!/bin/sh
build_airport() {
	echo $1;
	case $1 in
		*)	slope=0.025;
			perimeter=5.0;;
	esac
	genapts850 --threads --input=data/airports/$1.dat --work=./work-final --dem-path=SRTM-3 --max-slope=$slope --perimeter=$perimeter
}
if [ "$2" != "soft" ]
then
	echo "Hard rebuilt: Removing old work files";
	rm -r work-final/AirportArea work-final/AirportObj;
fi
if [ -z "$1" ]
then
	for i in data/airports/*.dat
	do 
		build_airport `echo $i| cut -c 15-18`;
	done
	build_airport XTF0002;
else
	build_airport $1;
fi
