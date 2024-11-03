#!/bin/bash

# Device adb ready assumed
# there's a "problem" with symlinks and users/groups with some binaries so .... PATHS need to be like this!!!

## dumpsys part
adb shell rm -rf /storage/emulated/0/dumpsys.log
adb shell su -c 'touch /storage/emulated/0/dumpsys.log'
adb shell su -c 'dumpsys > /sdcard/dumpsys.log'

## dmesg
adb shell rm -rf /storage/emulated/0/dmesg.log
adb shell su -c 'touch /storage/emulated/0/dmesg.log'
adb shell su -c 'dmesg > /sdcard/dmesg.log'

## /proc/x part
adb shell rm -rf /sdcard/proc.log
adb shell su -c 'touch /sdcard/proc.log'
adb shell su -c 'echo "\n# /proc/cpuinfo" > /sdcard/proc.log; cat /proc/cpuinfo >> /sdcard/proc.log'
adb shell su -c 'echo "\n# /proc/meminfo" >> /sdcard/proc.log; cat /proc/meminfo >> /sdcard/proc.log'
adb shell su -c 'echo "\n# /proc/version" >> /sdcard/proc.log; cat /proc/version >> /sdcard/proc.log'
adb shell su -c 'echo "\n# /proc/uptime" >> /sdcard/proc.log; cat /proc/uptime >> /sdcard/proc.log'
adb shell su -c 'echo "\n# /proc/loadavg" >> /sdcard/proc.log; cat /proc/loadavg >> /sdcard/proc.log'
adb shell su -c 'echo "\n# /proc/stat" >> /sdcard/proc.log; cat /proc/stat >> /sdcard/proc.log'
adb shell su -c 'echo "\n# /proc/vmstat" >> /sdcard/proc.log; cat /proc/vmstat >> /sdcard/proc.log'
adb shell su -c 'echo "\n# /proc/diskstats" >> /sdcard/proc.log; cat /proc/diskstats >> /sdcard/proc.log'
adb shell su -c 'echo "\n# /proc/net/dev" >> /sdcard/proc.log; cat /proc/net/dev >> /sdcard/proc.log'
adb shell su -c 'echo "\n# /proc/interrupts" >> /sdcard/proc.log; cat /proc/interrupts >> /sdcard/proc.log'
adb shell su -c 'echo "\n# /proc/modules" >> /sdcard/proc.log; cat /proc/modules >> /sdcard/proc.log'
adb shell su -c 'echo "\n# /proc/mounts" >> /sdcard/proc.log; cat /proc/mounts >> /sdcard/proc.log'
adb shell su -c 'echo "\n# /proc/partitions" >> /sdcard/proc.log; cat /proc/partitions >> /sdcard/proc.log'

## packages s/3
adb shell rm -rf /storage/emulated/0/packagesS.log /storage/emulated/0/packages3.log
adb shell su -c '/storage/emulated/0/packagesS.log /storage/emulated/0/packages3.log'
adb shell su -c 'pm list packages -s > /sdcard/packagesS.log'
adb shell su -c 'pm list packages -3 > /sdcard/packages3.log'

## getprop mola
adb shell rm -rf /storage/emulated/0/getprop.log
adb shell su -c '/storage/emulated/0/getprop.log'
adb shell su -c 'getprop > /sdcard/getprop.log'

## nets ipa
adb shell rm -rf /storage/emulated/0/ipa.log
adb shell su -c '/storage/emulated/0/ipa.log'
adb shell su -c 'ip a > /storage/emulated/0/ipa.log'

## pull part
adb pull /sdcard/dumpsys.log dumpsys.log
adb pull /sdcard/proc.log proc.log
adb pull /sdcard/dmesg.log dmesg.log
adb pull /sdcard/packagesS.log packagesS.log
adb pull /sdcard/packages3.log packages3.log
adb pull /sdcard/getprop.log getprop.log
adb pull /sdcard/ipa.log ipa.log

## processing part
# clear
python3 analytics.py
rm -rf *.log
