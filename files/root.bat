@echo off
cd files
adb wait-for-device
adb shell "cd /data/local && mkdir tmp"
adb shell "cd /data/local/tmp/ && rm *"
adb shell mv /data/local/tmp /data/local/tmp.bak
adb shell ln -s /data /data/local/tmp
adb reboot
adb wait-for-device
adb shell rm /data/local.prop > nul
adb shell "echo \"ro.kernel.qemu=1\" > /data/local.prop"
adb reboot
adb wait-for-device
adb push busybox /data/local/tmp/busybox
adb shell "chmod 755 /data/local/tmp/busybox"
adb shell "/data/local/tmp/busybox mount -o remount,rw /system"
adb push makespace /data/local/tmp/.
adb shell "chmod 777 /data/local/tmp/makespace"
adb shell "./data/local/tmp/makespace"
adb shell "dd if=/data/local/tmp/busybox of=/system/xbin/busybox"
adb shell "chown root.shell /system/xbin/busybox"
adb shell "chmod 04755 /system/xbin/busybox"
adb shell "/system/xbin/busybox --install -s /system/xbin"
adb shell "rm -r /data/local/tmp/busybox"
adb push su /system/bin/su
adb shell "chown root.shell /system/bin/su"
adb shell "chmod 06755 /system/bin/su"
adb shell "rm /system/xbin/su"
adb shell "ln -s /system/bin/su /system/xbin/su"
adb push Superuser.apk /system/app/Superuser.apk
adb shell rm /data/local.prop
adb shell rm /data/local/tmp
adb shell mv /data/local/tmp.bak /data/local/tmp
adb reboot
cd ..
