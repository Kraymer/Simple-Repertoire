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
    filedir="${file%/*}"
    filename="${file##*/}"
    filename_noext="${filename%.*}"
  	${MUSESCORE} --export-to ${OUTPUT_DIR}/out.png ${file}
    cd ${OUTPUT_DIR}
    cmd="convert -append "
    for png in `ls -A1 out*png`
    do
        convert ${png} -trim +repage trim-${png}
        cmd+=" spacer_260.png trim-${png}"
    done
    cmd+=" ${filename_noext}.png"
    $cmd
    ls /github/workspace/
    cp ${filename_noext}.png /github/workspace/${filedir}
  fi
  

done

