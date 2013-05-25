# Encript and Decript file:
# -------------------------
enfile () {
  filename=$(basename $1)
  filename="${filename%.*}"

  openssl enc -des3 -salt -in $1 -out ${filename}.enc
}

defile () {
  filename=$(basename $1)
  extension="${filename##*.}"
  filename="${filename%.*}"

  if [ $extension == "enc" ]; then
    openssl enc -d -des3 -in ${filename}.enc -out $filename
  fi
}