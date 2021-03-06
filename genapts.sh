#!/bin/sh
build_airport() {
	echo $1;
	case $1 in
		*)	slope=0.025;
			perimeter=5.0;;
	esac
	genapts850 --threads --input=data/airports/$1.dat --work=./work --dem-path=SRTM-3 --max-slope=$slope --perimeter=$perimeter
}
if [ "$2" != "soft" ]
then
	echo "Hard rebuilt: Removing old work files";
	rm -r work/AirportArea work/AirportObj;
fi
if [ -z "$1" ]
then
	for i in data/airports/*.dat
	do
		build_airport `echo $i| cut -c 15-18`;
	done
elif [ "$1" = "Ankara" ]
then
	for i in LTAB LTAC LTAD LTAE
	do
		build_airport $i;
	done
elif [ "$1" = "Izmir" ]
then
	for i in LTBJ LTBK LTFA LTBL
	do
		build_airport $i;
	done
else
	build_airport $1;
fi
