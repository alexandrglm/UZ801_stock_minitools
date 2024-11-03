#!/bin/bash

if ! command -v fastboot &> /dev/null; then
    echo "ERROR: Check fastboot bin path!"
    exit 1
fi
output_dir="./output"

declare -A partitions=(
    ["modem"]="modem.img"
    ["sbl1"]="sbl1.img"
    ["sbl1bak"]="sbl1bak.img"
    ["aboot"]="aboot.img"
    ["abootbak"]="abootbak.img"
    ["rpm"]="rpm.img"
    ["rpmbak"]="rpmbak.img"
    ["tz"]="tz.img"
    ["tzbak"]="tzbak.img"
    ["hyp"]="hyp.img"
    ["hypbak"]="hypbak.img"
    ["pad"]="pad.img"
    ["modemst1"]="modemst1.img"
    ["modemst2"]="modemst2.img"
    ["misc"]="misc.img"
    ["fsc"]="fsc.img"
    ["ssd"]="ssd.img"
    ["splash"]="splash.img"
    ["DDR"]="DDR.img"
    ["fsg"]="fsg.img"
    ["sec"]="sec.img"
    ["boot"]="boot.img"
    ["system"]="system.img"
    ["persist"]="persist.img"
    ["cache"]="cache.img"
    ["recovery"]="recovery.img"
    ["userdata"]="userdata.img"
    ["PrimaryGPT"]="gpt_main0.img"
    ["BackupGPT"]="gpt_backup0.img"
)

for partition in "${!partitions[@]}"; do
    img_file="$output_dir/${partitions[$partition]}"
    if [[ ! -f "$img_file" ]]; then
        echo "There's no $img_file for $partition partition, check again before flashing."
        exit 1
    fi
done

echo "Entering fastboot mode...."
adb reboot bootloader
sleep 5

for partition in "${!partitions[@]}"; do
    img_file="$output_dir/${partitions[$partition]}"
    echo "Erasing $partition ..."
    fastboot erase "$partition"
    
    echo "Flashing $partition with $img_file ..."
    fastboot flash "$partition" "$img_file"
done

echo "Success! :-) Rebooting device ..."
fastboot reboot

echo "Done!"
