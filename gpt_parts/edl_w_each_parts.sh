#!/bin/bash

partition_dir="./output"
if [[ ! -d "$partition_dir" ]]; then
    echo "Partition directory not found: $partition_dir"
    exit 1
fi

edl_w_parts() {
    local partition_name=$1
    local partition_img=$2

    if [[ -f "$partition_img" ]]; then
        echo "Writing $partition_name partition... wait ..."
        edl w "$partition_name" "$partition_img"
    else
        echo "Image file not found for $partition_name: $partition_img ... Verify path/file.EXTENSION !"
    fi
}

edl_w_parts "modem" "$partition_dir/modem.img"
edl_w_parts "sbl1" "$partition_dir/sbl1.img"
edl_w_parts "sbl1bak" "$partition_dir/sbl1bak.img"
edl_w_parts "aboot" "$partition_dir/aboot.img"
edl_w_parts "abootbak" "$partition_dir/abootbak.img"
edl_w_parts "rpm" "$partition_dir/rpm.img"
edl_w_parts "rpmbak" "$partition_dir/rpmbak.img"
edl_w_parts "tz" "$partition_dir/tz.img"
edl_w_parts "tzbak" "$partition_dir/tzbak.img"
edl_w_parts "hyp" "$partition_dir/hyp.img"
edl_w_parts "hypbak" "$partition_dir/hypbak.img"
edl_w_parts "pad" "$partition_dir/pad.img"
edl_w_parts "modemst1" "$partition_dir/modemst1.img"
edl_w_parts "modemst2" "$partition_dir/modemst2.img"
edl_w_parts "misc" "$partition_dir/misc.img"
edl_w_parts "fsc" "$partition_dir/fsc.img"
edl_w_parts "ssd" "$partition_dir/ssd.img"
edl_w_parts "splash" "$partition_dir/splash.img"
edl_w_parts "DDR" "$partition_dir/DDR.img"
edl_w_parts "fsg" "$partition_dir/fsg.img"
edl_w_parts "sec" "$partition_dir/sec.img"
edl_w_parts "boot" "$partition_dir/boot.img"
edl_w_parts "system" "$partition_dir/system.img"
edl_w_parts "persist" "$partition_dir/persist.img"
edl_w_parts "cache" "$partition_dir/cache.img"
edl_w_parts "recovery" "$partition_dir/recovery.img"
edl_w_parts "userdata" "$partition_dir/userdata.img"
edl_w_parts "PrimaryGPT" "$partition_dir/gpt_main0.img" 
edl_w_parts "BackupGPT" "$partition_dir/gpt_backup0.img"

echo "Done!"
