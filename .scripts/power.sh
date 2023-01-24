#!/bin/bash

powered=$(cat /sys/class/power_supply/AC0/online)
if [ $powered == "1" ]; then
    /usr/bin/system76-power profile performance
else
    /usr/bin/system76-power profile battery
fi
