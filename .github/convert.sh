#!/bin/bash
set -x

export QT_QPA_PLATFORM=offscreen
MUSESCORE=/usr/local/bin/musescore
OUTPUT_DIR=/tmp/simplerep

mkdir ${OUTPUT_DIR}

read -ra arr <<<"$@"
for a in ; do echo "[$a]"; done

for file in "${arr[@]}"
do

  if [[ ${file} =~ \.(mscx)$ ]]; then
  	${MUSESCORE} --export-to ${OUTPUT_DIR}/out.png ${file}
    cd ${OUTPUT_DIR}
    for file in `ls -A1`
    do
        convert ${file} -trim +repage trim-${file}.png
    done

  fi
  

done
