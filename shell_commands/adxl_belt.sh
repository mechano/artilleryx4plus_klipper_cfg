#!/bin/bash
#set -e -u -o pipefail
 
## the TEST_RESONANCES command seems to return before all data is completely
## written. it'd be better to poll for the files to be completely written,
## but this has been reliable for me so far…
sleep 10
 
outdir=/home/mks/printer_data/config/input_shaper
if [ ! -d "${outdir}" ]; then
    mkdir "${outdir}"
fi
 
/home/mks/klipper/scripts/graph_accelerometer.py \
    -c /tmp/*.csv \
    -o "${outdir}/belt-tension-resonances-$( date +'%Y-%m-%d-%H%M%S' ).png"
 
rm /tmp/raw_data_axis*