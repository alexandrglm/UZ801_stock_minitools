First notes:  

If the firmware comes already rooted, first try unrooting it:  

E.g.;
```
$ adb shell mount -o remount,rw /system
$ adb shell rm /system/bin/su
$ adb shell rm /system/xbin/su
$ adb shell mount -o remount,ro /system
$ adb shell reboot
```

Then, patch stock boot.img with Magisk v22.1, the latest which supports Android API 19.  
Updating process won't be available using ADB_ScreenMirror because an usable file explorer lack.  
So,

1. Download Magisk v22.1 apk and stub-release.apk from https://github.com/topjohnwu/Magisk/releases/tag/v22.1  
2. Download magiskuz801_patcher.zip and copy stock boot.img to its folder.  
3. Run boot_patch.sh. A new-boot.img will be created.  
4. Fastboot flash boot new-boot.img && fastboot reboot  
5. Install the magisk v22.1 apk via adb install {magisk v22.1 apk file}  



   
