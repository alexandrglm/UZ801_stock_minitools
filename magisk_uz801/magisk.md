## First notes:  
If the firmware comes already rooted, first try unrooting it:  

E.g.:  
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
4. ```Fastboot flash boot new-boot.img && fastboot reboot```  
5. Install magisk v22.1 apk via ```adb install {magisk v22.1 apk file}``` 



### _magiskuz801_patcher_.zip content:  

Files extracted from magisk22.1.apk:

- boot_patch.sh
- magisk32
- magisk64
- magiskboot  
- util_functions.sh, with few modifications to be working outside android

Files extracted from an upper magisk apk version:
- magiskinit, from x86_64 version, in order to start and manipulating boot.img from a PC

Others:
- stub.apk, v22.1, from magisk' github (but it does not seem to be working like this)



# Don't take risks and remember not to forget doing full nand backups from each partition before any matter with boot.
   
