#!/usr/bin/env bash

grep_info="Bus 002 Device 005: ID 06df:2af9 WIBU-Systems AG"

mapfile array < <(`lsusb | grep "WIBU" | awk -F ":" '{print $1 $2}' | awk '{print $2, $4}'`)
/root/usbreset /dev/bus/usb/${array[0]}/${array[1]}

exit 0