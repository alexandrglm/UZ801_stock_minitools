#!/bin/bash

# Device adb ready assumed
adb shell su -c 'touch /sdcard/dumpsys.log' && adb shell su -c 'dumpsys > /sdcard/dumpsys.log' && adb pull /sdcard/dumpsys.log dumpsys.log && clear && python3 dumpsys.py
