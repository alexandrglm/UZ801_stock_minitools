Firmware 2023 02.
Bootloader unlock via fastboot oem unlock, capable.
lk2nd boot available


```
# fastboot oem device-info
                                                   (bootloader)         Device tampered: false
(bootloader)    Device unlocked: false
(bootloader)    Charger screen enabled: true
(bootloader)    Display panel: 
OKAY [  0.005s]
```
```
# fastboot oem unlock
                                                   OKAY [  0.276s]
Finished. Total time: 0.276s
```

```
# fastboot oem device-info
                                                   (bootloader)         Device tampered: false
(bootloader)    Device unlocked: true
(bootloader)    Charger screen enabled: true
(bootloader)    Display panel: 
OKAY [  0.005s]
Finished. Total time: 0.005s
```

