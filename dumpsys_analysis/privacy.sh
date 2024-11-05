#!/bin/bash  
# bash shebangs may give errors, try changing
# the use of find could improves the extension instead modularity/visibility, but it's so fine

findSerials () {
  local text="$1"
  # awk '/\[ro.serial.no]:/ {serial=$2}; gsub (serial, "PRIVACY_REMOVED" {print $0]}' <<< "$text") 
  # text=$(awk '/\[ro.serial.no]:/ {serial=$2}; gsub (serial, "PRIVACY_REMOVED" 1' <<< "$text")
  text=$(awk '/\[ro\.serialno\]:/ {serial=$2; gsub(serial, "PRIVACY_REMOVED")} 1' <<< "$text")
}

privacyLog() {
#  find ./www/ -name "*.html" -print0 | while IFS= read -r -d $'\0' htmlPath; do
#    text=$(cat "$htmlPath")
#    text=$(findSerials "$text")
#    text=$(echo "$text" | sed -E '
#      s/[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}/PRIVACY_REMOVED/g; # ipv4
#      s/(^|\s)([0-9a-fA-F]{1,4}:){7}[0-9a-fA-F]{1,4}\/[0-9]{1,3}(\s|$)/\1\3/g; #ipv6
#      s/([0-9a-fA-F]{2}:){5}[0-9a-fA-F]{2}/PRIVACY_REMOVED/g; # macs
#      s/\[android-.*\]/PRIVACY_REMOVED/g; # hosts
#      s/\[ro.serialno]: \[.*\]/PRIVACY_REMOVED/g # serials
#      ')
#      echo "$text" > "$htmlpath"
#    done && echo "Done!!"
  
  local text="$1"

  # IPv4&6
  text=$(echo "text" | sed -E 's/[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}/PRIVACY_REMOVED/g')
  text=$(echo "text" | 's/(^|\s)([0-9a-fA-F]{1,4}:){7}[0-9a-fA-F]{1,4}\/[0-9]{1,3}(\s|$)/\1\3/PRIVACY_REMOVED/g') # not easy syntax for every possible ipv6 without removing another data
  # wlan/bt/ether MACs
  text=$(echo "text" | sed -E 's/([0-9a-fA-F]{2}:){5}[0-9a-fA-F]{2}/PRIVACY_REMOVED/g')
  # Hosts lines from proc
  text=$(echo "text" | sed -E 's/\[android-.*\]/PRIVACY_REMOVED/g')
  # Serial lines from proc
  text=$(echo "text" | sed -E ' s/\[ro.serialno]: \[.*\]/PRIVACY_REMOVED/g ')
  # add more filters when needed
  
htmlPath=(./www/*.html)
for htmlpath in ("${htmlPath}[@]"; do
  echo "Removing sensitive data from each report..."

  original=$(cat "$htmlPath")
  replaced=$(replacedSensitive "$original")
  echo "$replaced" > "$htmlPath"
done
echo "D0ne!"
