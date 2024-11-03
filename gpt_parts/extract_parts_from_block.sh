#!/bin/bash

nand_dump="myflash.bin"  
output_dir="./output"
mkdir -p "$output_dir"

echo "Extracting modem partition..."
dd if="$nand_dump" of="$output_dir/modem.img" bs=1 count=$((0x4000000)) skip=$((0x4000000))
echo "Extracting sbl1 partition..."
dd if="$nand_dump" of="$output_dir/sbl1.img" bs=1 count=$((0x80000)) skip=$((0x8000000))
echo "Extracting sbl1bak partition..."
dd if="$nand_dump" of="$output_dir/sbl1bak.img" bs=1 count=$((0x80000)) skip=$((0x8080000))
echo "Extracting aboot partition..."
dd if="$nand_dump" of="$output_dir/aboot.img" bs=1 count=$((0x100000)) skip=$((0x8100000))
echo "Extracting abootbak partition..."
dd if="$nand_dump" of="$output_dir/abootbak.img" bs=1 count=$((0x100000)) skip=$((0x8200000))
echo "Extracting rpm partition..."
dd if="$nand_dump" of="$output_dir/rpm.img" bs=1 count=$((0x80000)) skip=$((0x8300000))
echo "Extracting rpmbak partition..."
dd if="$nand_dump" of="$output_dir/rpmbak.img" bs=1 count=$((0x80000)) skip=$((0x8380000))
echo "Extracting tz partition..."
dd if="$nand_dump" of="$output_dir/tz.img" bs=1 count=$((0x80000)) skip=$((0x8400000))
echo "Extracting tzbak partition..."
dd if="$nand_dump" of="$output_dir/tzbak.img" bs=1 count=$((0x80000)) skip=$((0x8480000))
echo "Extracting hyp partition..."
dd if="$nand_dump" of="$output_dir/hyp.img" bs=1 count=$((0x80000)) skip=$((0x8500000))
echo "Extracting hypbak partition..."
dd if="$nand_dump" of="$output_dir/hypbak.img" bs=1 count=$((0x80000)) skip=$((0x8580000))
echo "Extracting pad partition..."
dd if="$nand_dump" of="$output_dir/pad.img" bs=1 count=$((0x100000)) skip=$((0x8600000))
echo "Extracting modemst1 partition..."
dd if="$nand_dump" of="$output_dir/modemst1.img" bs=1 count=$((0x180000)) skip=$((0x8700000))
echo "Extracting modemst2 partition..."
dd if="$nand_dump" of="$output_dir/modemst2.img" bs=1 count=$((0x180000)) skip=$((0x8880000))
echo "Extracting misc partition..."
dd if="$nand_dump" of="$output_dir/misc.img" bs=1 count=$((0x100000)) skip=$((0x8a00000))
echo "Extracting fsc partition..."
dd if="$nand_dump" of="$output_dir/fsc.img" bs=1 count=$((0x400)) skip=$((0x8b00000))
echo "Extracting ssd partition..."
dd if="$nand_dump" of="$output_dir/ssd.img" bs=1 count=$((0x2000)) skip=$((0x8b00400))
echo "Extracting splash partition..."
dd if="$nand_dump" of="$output_dir/splash.img" bs=1 count=$((0xa00000)) skip=$((0x8b02400))
echo "Extracting DDR partition..."
dd if="$nand_dump" of="$output_dir/DDR.img" bs=1 count=$((0x8000)) skip=$((0xc000000))
echo "Extracting fsg partition..."
dd if="$nand_dump" of="$output_dir/fsg.img" bs=1 count=$((0x180000)) skip=$((0xc008000))
echo "Extracting sec partition..."
dd if="$nand_dump" of="$output_dir/sec.img" bs=1 count=$((0x4000)) skip=$((0xc188000))
echo "Extracting boot partition..."
dd if="$nand_dump" of="$output_dir/boot.img" bs=1 count=$((0x1000000)) skip=$((0xc18c000))
echo "Extracting system partition..."
dd if="$nand_dump" of="$output_dir/system.img" bs=1 count=$((0x32000000)) skip=$((0xd18c000))
echo "Extracting persist partition..."
dd if="$nand_dump" of="$output_dir/persist.img" bs=1 count=$((0x2000000)) skip=$((0x3f18c000))
echo "Extracting cache partition..."
dd if="$nand_dump" of="$output_dir/cache.img" bs=1 count=$((0x8000000)) skip=$((0x4118c000))
echo "Extracting recovery partition..."
dd if="$nand_dump" of="$output_dir/recovery.img" bs=1 count=$((0x1000000)) skip=$((0x4918c000))
echo "Extracting userdata partition..."
dd if="$nand_dump" of="$output_dir/userdata.img" bs=1 count=$((0x99e6fe00)) skip=$((0x4a18c000))

echo "Done!"
