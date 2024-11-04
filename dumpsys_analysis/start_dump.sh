#!/bin/sh

echo "#########################################################"
echo "# - Device Analysis tool - v.0.3                        #"
echo "#                                                       #"
echo "# Author: Alexandr Gomez @alexandrglm                   #"
echo "# Nov, 4. 2024                                          #"
echo "#########################################################"
echo ""
echo ""
echo "Retrieving data from device, please wait."
echo ""

# Parte de dumpsys
adb shell rm -rf /sdcard/dumpsys.log
adb shell "touch /sdcard/dumpsys.log"
adb shell "dumpsys > /sdcard/dumpsys.log"

# Parte de dmesg
adb shell rm -rf /sdcard/dmesg.log
adb shell "touch /sdcard/dmesg.log"
adb shell "dmesg > /sdcard/dmesg.log"

# Parte de /proc
adb shell rm -rf /sdcard/proc.log
adb shell "touch /sdcard/proc.log"
adb shell "echo -e '\n# /proc/cpuinfo' > /sdcard/proc.log; cat /proc/cpuinfo >> /sdcard/proc.log"
adb shell "echo -e '\n# /proc/meminfo' >> /sdcard/proc.log; cat /proc/meminfo >> /sdcard/proc.log"
adb shell "echo -e '\n# /proc/version' >> /sdcard/proc.log; cat /proc/version >> /sdcard/proc.log"
adb shell "echo -e '\n# /proc/uptime' >> /sdcard/proc.log; cat /proc/uptime >> /sdcard/proc.log"
adb shell "echo -e '\n# /proc/loadavg' >> /sdcard/proc.log; cat /proc/loadavg >> /sdcard/proc.log"
adb shell "echo -e '\n# /proc/stat' >> /sdcard/proc.log; cat /proc/stat >> /sdcard/proc.log"
adb shell "echo -e '\n# /proc/vmstat' >> /sdcard/proc.log; cat /proc/vmstat >> /sdcard/proc.log"
adb shell "echo -e '\n# /proc/diskstats' >> /sdcard/proc.log; cat /proc/diskstats >> /sdcard/proc.log"
adb shell "echo -e '\n# /proc/net/dev' >> /sdcard/proc.log; cat /proc/net/dev >> /sdcard/proc.log"
adb shell "echo -e '\n# /proc/interrupts' >> /sdcard/proc.log; cat /proc/interrupts >> /sdcard/proc.log"
adb shell "echo -e '\n# /proc/modules' >> /sdcard/proc.log; cat /proc/modules >> /sdcard/proc.log"
adb shell "echo -e '\n# /proc/mounts' >> /sdcard/proc.log; cat /proc/mounts >> /sdcard/proc.log"
adb shell "echo -e '\n# /proc/partitions' >> /sdcard/proc.log; cat /proc/partitions >> /sdcard/proc.log"

# pm list installed -s / -3
adb shell rm -rf /sdcard/packagesS.log /sdcard/packages3.log
adb shell "touch /sdcard/packagesS.log /sdcard/packages3.log"
adb shell "pm list packages -s > /sdcard/packagesS.log"
adb shell "pm list packages -3 > /sdcard/packages3.log"

# Parte de getprop
adb shell rm -rf /sdcard/getprop.log
adb shell "touch /sdcard/getprop.log"
adb shell "getprop > /sdcard/getprop.log"

# Parte de ip a
adb shell rm -rf /sdcard/ipa.log
adb shell "touch /sdcard/ipa.log"
adb shell "ip a > /sdcard/ipa.log"

# Descargar archivos generados a la máquina local
adb pull /sdcard/dumpsys.log dumpsys.log
adb pull /sdcard/proc.log proc.log
adb pull /sdcard/dmesg.log dmesg.log
adb pull /sdcard/packagesS.log packagesS.log
adb pull /sdcard/packages3.log packages3.log
adb pull /sdcard/getprop.log getprop.log
adb pull /sdcard/ipa.log ipa.log

# Procesamiento de datos
clear
echo "Procesing data ..."
python3 analytics.py
# rm -rf *.log

echo "Done!"
