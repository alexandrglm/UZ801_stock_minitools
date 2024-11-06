# mifi.hello webGUI modified
Development in progress.


# UZ801 webGUI stock menu layout
## HOME
    ### Internet Connection
    
        IP ADDR:    $ip
        Mask:       $mask
        Dns:        $dns
    
        Rx:         $rx kb
        Tx:         $tx kb
    
    ### Wi-Fi Status
    
        SSID:       $wlanSSID
        IP Wlan     $wlanIP
        Users:      $wlanUsers
        Password:   $wlanPassword
        
    ### Network Connection
    
        Menu Conn:  Enabled/Disabled
        
        
## Network Select

    ### Network Selection
    
        Networks: Auto / 3G / 4G


## Wi-Fi

    ### WI-FI Setting
    
        STATUS          ON / OFF
        IP Wlan
        MAC             Wlan mac addr
        SSID            input($SSID)
        Max Station     1 to 10
        
    ### WI-FI Security
    
        Encryption      None / WPA TKIP / WPA CCMP / WPA2 TKIP / WPA2 CCMP
        Password:       input($wlanPassword)
        
        
## Advanced
    
    ### Device Information
    
        IMEI            input($nImei)
        Manufacturer    $platform 
        Model           $model // ajax 1xxx
        dbm:            $signal_dbm // ajax 1xxx (signal strenght)
    
    ### Device Opertation
    
        Device Restart  button($restart)
        Factory Reset   button($factoryreset)
        
    ### APN Configuration
    
        Profile X
            
            Name:       input($apn_name_x)
            APN:        input($apn_addr_x)
            User:       input($apn_user_x)
            Password:   input($apn_pwd_x)
            Auth:       check($AP,$CHAP, $CHAP/PAP, None)
            
        APN Profile selection:
        
            5 profiles + default blank profile
        
    ### SIM Information
            
            Status:     $sim_status ('Present', 'Absent')
            IMSI:       $sim_imsi
            ICC ID:     $sim_iccid
            
    ### Modify webGUI password
    
            Old:        input($current_gui_pwd)
            New:        input($new_gui_pwd)
            
    ### MAC addr filter:
    
        Curren Devices: shows current connected devices via wlan
        
        MAC Addres Filter:
            
            MAC List:    Close / Blacklist / Whitelist
            
## Firmware Upgrade
    
        Text, informing about firm update proccess.
        
            Product model:  $product_model
            Firm. version:  $firm_version
            
            An uploading interface.
            
## Help        Direct link to a ZN! PDF from the server. (There's an EN manual pdf, unused)
