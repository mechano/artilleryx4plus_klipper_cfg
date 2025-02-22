#!/bin/bash
 
NEWX=$(ls -Art /tmp/calibration_data_x_*.csv | tail -n 1)
DATE=$(date +'%Y-%m-%d-%H%M%S')
 
outdir=/home/mks/printer_data/config/input_shaper
if [ ! -d "${outdir}" ]; then
    mkdir "${outdir}"
fi
 
/home/mks/klipper/scripts/calibrate_shaper.py $NEWX -o "${outdir}/resonances_x_$DATE.png"
 
rm /tmp/calibration_data_x_*.csv