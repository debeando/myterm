# Get Battery status:
# -------------------
battery() {
  ioreg -c AppleSmartBattery -w0 | \
    grep -o '"[^"]*" = [^ ]*' | \
    sed -e 's/= //g' -e 's/"//g' | \
    sort | \
    while read key value; do
      case $key in
        "MaxCapacity")
          export maxcap=$value;;
        "CurrentCapacity")
          export curcap=$value;;
        "ExternalConnected")
          export extconnect=$value;;
        "FullyCharged")
          export fully_charged=$value;;
      esac
      if [[ -n $maxcap && -n $curcap && -n $extconnect ]]; then
        if [[ "$curcap" == "$maxcap" || "$fully_charged" == "Yes" && $extconnect == "Yes"  ]]; then
          echo "♥ 100%"
          return
        fi

        charge=$(( 100 * $curcap / $maxcap ))

        if [[ "$extconnect" == "Yes" ]]; then
          echo "≈ ${charge}%"
        else
          if [[ $charge -lt 50 ]]; then
            echo "♡ ${charge}%"
          else
            echo "♥ ${charge}%"
          fi
        fi
        break
      fi
    done
}
