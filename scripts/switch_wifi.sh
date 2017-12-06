#!/bin/bash

# get current wifi device
CURRENT_DEVICE=$(networksetup -listallhardwareports | awk '$3=="Wi-Fi" {getline; print $2}')
WIFI_STATUS=$(networksetup -getairportnetwork $CURRENT_DEVICE)
NO_WIFI="Current"

echo 
echo "Wi-Fi Interface = '$CURRENT_DEVICE'"
echo $WIFI_STATUS
echo 
 
echo {$WIFI_STATUS | egrep 'not'}


if $Result
then
    # turn off wifi
   #networksetup -setairportpower CURRENT_DEVICE off 
   echo "if clause reached"
   echo "Network Turned Off"
else
    # turn on wifi
   #networksetup -setairportpower $CURRENT_DEVICE on 
    echo "else clause reached"
    echo "Network Turned On"
fi


