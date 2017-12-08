if [ -d .git ]; then
  rbv=`rbenv version`
  [[ $rbv == *"@"* ]] || rbv="[${rbv:0:5}]"
  echo $rbv
fi