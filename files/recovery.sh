#!/bin/bash
@echo off

cd files

if [ $1 == "terminal" ] 
then
adb wait-for-device
adb push $2 /data/local/tmp/cwm.img
adb shell "su -c 'dd if=/data/local/tmp/cwm.img of=/dev/block/mmcblk0p13; rm /data/local/tmp/cwm.img'"
adb reboot recovery
cd ..
exit


elif [ $1 == "fastboot" ]
then
adb wait-for-device
adb reboot bootloader
fastboot flash recovery $2
fastboot boot $2
cd..
exit

fi
