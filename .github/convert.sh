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
    cmd="convert -append "
    for file in `ls -A1`
    do
        convert ${file} -trim +repage trim-${file}.png
        cmd+=" spacer_260.png trim-${file}.png"
    done
    cmd+=" final.png"
    $cmd
  fi
  

done

