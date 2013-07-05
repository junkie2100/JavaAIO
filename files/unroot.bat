@echo off
cd files
adb wait-for-device
adb shell "su -c 'echo --- Superuser check successful'"
adb shell "cd /data/local/tmp/; rm *"
adb shell "chmod 755 /data/local/tmp/busybox"
adb shell "su -c '/data/local/tmp/busybox mount -o remount,rw /system'"
adb shell "chmod 777 /data/local/tmp/unroot"
adb shell "su -c '/data/local/tmp/unroot'"
adb shell "cd /data/local/tmp/; rm *"
adb reboot
cd ..
