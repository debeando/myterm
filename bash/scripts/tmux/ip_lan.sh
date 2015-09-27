all_nics=$(ifconfig 2>/dev/null | awk -F':' '/^[a-z]/ && !/^lo/ { print $1 }')
for nic in ${all_nics[@]}; do
  ipv4s_on_nic=$(ifconfig ${nic} 2>/dev/null | awk '$1 == "inet" { print $2 }')
  for lan_ip in ${ipv4s_on_nic[@]}; do
    if [[ $nic == "en1" || $nic == "en0" ]]; then
      echo "ⓛ $lan_ip"
    fi
  done
done