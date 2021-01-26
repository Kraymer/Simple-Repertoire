#!/bin/bash

# Extract musescore sheet file from filenames given in argument.
# Export sheet to png files and stitch them vertically to obtain a single sheet
# image. 


export QT_QPA_PLATFORM=offscreen
MUSESCORE=/usr/local/bin/musescore
OUTPUT_DIR=/tmp/simplerep

read -ra arr <<<"$@"
for a in ; do echo "[$a]"; done

for file in "${arr[@]}"
do

  if [[ ${file} =~ \.(mscx)$ ]]; then
    filedir="${file%/*}"
    filename="${file##*/}"
    filename_noext="${filename%.*}"
  	${MUSESCORE} --export-to ${OUTPUT_DIR}/out.png ${file}
    ${MUSESCORE} --export-to ${OUTPUT_DIR}/${filename_noext}.pdf ${file}
    cd ${OUTPUT_DIR}
    cmd="convert -append -background WhiteSmoke -alpha remove -alpha off "
    for png in `ls -A1 out*png`
    do
        convert ${png} -trim +repage trim-${png}
        cmd+=" spacer_260.png trim-${png}"
    done
    cmd+=" ${filename_noext}.png"
    $cmd
    ls /github/workspace/
    cp ${filename_noext}.png /github/workspace/${filedir}
    cp ${filename_noext}.pdf /github/workspace/${filedir}
  fi
  
done

