#!/bin/bash
@echo off
cd files
adb-mac wait-for-device
adb-mac shell "su -c 'echo --- Superuser check successful'"
adb-mac shell "cd /data/local/tmp/; rm *"
adb-mac shell "chmod 755 /data/local/tmp/busybox"
adb-mac shell "su -c '/data/local/tmp/busybox mount -o remount,rw /system'"
adb-mac shell "chmod 777 /data/local/tmp/unroot"
adb-mac shell "su -c '/data/local/tmp/unroot'"
adb-mac shell "cd /data/local/tmp/; rm *"
adb-mac reboot
cd ..
