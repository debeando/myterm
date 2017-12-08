wan_ip=$(curl --max-time 2 -s http://whatismyip.akamai.com/)
if [ "$?" -eq "0" ]; then
  echo "ⓦ ${wan_ip}"
fi