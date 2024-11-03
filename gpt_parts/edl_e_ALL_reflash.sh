#!/bin/bash

if ! command -v edl_cmd &> /dev/null; then
    echo "ERROR: Check EDL, chroot, python env, etc..."
    exit 1
fi

output_dir="./output"
edl_cmd="/usr/local/bin/edl"

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
        echo "ERROR: There's no $img_file to be flashed at $partition."
        exit 1
    fi
done

for partition in "${!partitions[@]}"; do
    img_file="$output_dir/${partitions[$partition]}"
    echo "Erasing $partition ..."
    edl e "$partition"
    
    echo "Writing $img_file at $partition ..."
    edl w "$partition" "$img_file"
done

echo "Done!"
