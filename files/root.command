#!/bin/bash
@echo off
cd files
adb-mac wait-for-device
adb-mac shell "cd /data/local && mkdir tmp"
adb-mac shell "cd /data/local/tmp/ && rm *"
adb-mac shell mv /data/local/tmp /data/local/tmp.bak
adb-mac shell ln -s /data /data/local/tmp
adb-mac reboot
adb-mac wait-for-device
adb-mac shell rm /data/local.prop > nul
adb-mac shell "echo \"ro.kernel.qemu=1\" > /data/local.prop"
adb-mac reboot
adb-mac wait-for-device
adb-mac push busybox /data/local/tmp/busybox
adb-mac shell "chmod 755 /data/local/tmp/busybox"
adb-mac shell "/data/local/tmp/busybox mount -o remount,rw /system"
adb-mac push makespace /data/local/tmp/.
adb-mac shell "chmod 777 /data/local/tmp/makespace"
adb-mac shell "./data/local/tmp/makespace"
adb-mac shell "dd if=/data/local/tmp/busybox of=/system/xbin/busybox"
adb-mac shell "chown root.shell /system/xbin/busybox"
adb-mac shell "chmod 04755 /system/xbin/busybox"
adb-mac shell "/system/xbin/busybox --install -s /system/xbin"
adb-mac shell "rm -r /data/local/tmp/busybox"
adb-mac push su /system/bin/su
adb-mac shell "chown root.shell /system/bin/su"
adb-mac shell "chmod 06755 /system/bin/su"
adb-mac shell "rm /system/xbin/su"
adb-mac shell "ln -s /system/bin/su /system/xbin/su"
adb-mac push Superuser.apk /system/app/Superuser.apk
adb-mac shell rm /data/local.prop
adb-mac shell rm /data/local/tmp
adb-mac shell mv /data/local/tmp.bak /data/local/tmp
adb-mac reboot
cd ..
