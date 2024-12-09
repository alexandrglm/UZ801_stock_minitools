#!/bin/bash  
# bash shebangs may give errors, try changing
# Using "find" method would improves the extension instead modularity/visibility, but this was fine like this.

findSerials () {
  local text="$1"
  text=$(awk '/\[ro\.serialno\]:/ {serial=$2; gsub(serial, "PRIVACY_REMOVED")} 1' <<< "$text")
}

privacyLog() {
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
