alias hgtchop=/home/delta/Programme/flightgear/new_fgmeta/install/terragear/bin/hgtchop
alias terrafit=/home/delta/Programme/flightgear/new_fgmeta/install/terragear/bin/terrafit
for f in ${PWD}/data/SRTM-3/*.hgt; do hgtchop 3 "${f}" "${PWD}/work-final/SRTM-3"; done
terrafit work-final/SRTM-3
