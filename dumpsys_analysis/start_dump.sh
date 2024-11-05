#!/bin/sh

echo "#########################################################"
echo "# - Device Analysis tool - v.0.4                        #"
echo "#                                                       #"
echo "# Author: Alexandr Gomez @alexandrglm                   #"
echo "# Nov, 5. 2024                                          #"
echo "#########################################################"
echo ""
echo ""
echo "Retrieving data from device, please wait."
echo ""

# Parte de dumpsys
adb shell rm -rf /sdcard/dumpsys.log
adb shell "touch /sdcard/dumpsys.log"
adb shell "dumpsys > /sdcard/dumpsys.log"
echo "Retrieving dumpsys ...."

# Parte de dmesg
adb shell rm -rf /sdcard/dmesg.log
adb shell "touch /sdcard/dmesg.log"
adb shell "dmesg > /sdcard/dmesg.log"
echo "Retrieving dmesg ...."

# Parte de /proc
adb shell rm -rf /sdcard/proc.log
echo "Retrieving and proccessing /proc/ data ...."
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
echo "Retrieving all installed packages ..."
adb shell "pm list packages -s > /sdcard/packagesS.log"
adb shell "pm list packages -3 > /sdcard/packages3.log"

# Parte de getprop
adb shell rm -rf /sdcard/getprop.log
adb shell "touch /sdcard/getprop.log"
echo "Retrieving getprop ...."
adb shell "getprop > /sdcard/getprop.log"

# Parte de ip a
adb shell rm -rf /sdcard/ipa.log
adb shell "touch /sdcard/ipa.log"
echo "Retrieving ip a data ...."
adb shell "ip a > /sdcard/ipa.log"

# parte de full root paths, no es posible añadir ls -l aún a cada file/path, no tendran attr
adb shell "rm -rf /sdcard/files.log*"
echo "Retrieving / data ..."
adb shell "busybox find / > /sdcard/files.log"

### ## ## ## ##  parte de get available binaries
## /system/bin
adb shell "ls /system/bin > /sdcard/bin_system_bin.log"
adb shell "echo '# /system/bin available binaries:\n' > /sdcard/system_bins.log"
adb shell "cat /sdcard/bin_system_bin.log >> /sdcard/system_bins.log"
adb shell "echo '(end)\n\n' >> /sdcard/system_bins.log"

## /system/xbin
adb shell "ls /system/xbin > /sdcard/bin_system_xbin.log"
adb shell "echo '# /system/xbin available binaries:\n' >> /sdcard/system_bins.log"
adb shell "cat /sdcard/bin_system_xbin.log >> /sdcard/system_bins.log"
adb shell "echo '(end)\n\n' >> /sdcard/system_bins.log"

## /sbin
adb shell "ls /sbin > /sdcard/bin_sbin.log"
adb shell "echo '# /sbin available binaries:\n' >> /sdcard/system_bins.log"
adb shell "cat /sdcard/bin_sbin.log >> /sdcard/system_bins.log"
adb shell "echo '(end)\n\n' >> /sdcard/system_bins.log"

adb shell "rm -rf  /sdcard/bin_system_bin.log /sdcard/bin_system_xbin.log /sdcard/bin_sbin.log"

### ## ## ## ##  parte de get busybox bins/functions
adb shell "busybox --help > /sdcard/busybox.log"

# Descargar archivos generados a la máquina local
adb pull /sdcard/dumpsys.log dumpsys.log
adb pull /sdcard/proc.log proc.log
adb pull /sdcard/dmesg.log dmesg.log
adb pull /sdcard/packagesS.log packagesS.log
adb pull /sdcard/packages3.log packages3.log
adb pull /sdcard/getprop.log getprop.log
adb pull /sdcard/ipa.log ipa.log
adb pull /sdcard/files.log
adb pull /sdcard/system_bins.log
adb pull /sdcard/busybox.log

clear
echo "Procesing data ..."
python3 analytics.py
rm -rf *.log
echo "Done!"
