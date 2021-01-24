#!/bin/bash
set -x

repo_path=$1
cd /github/workspace


read -ra arr <<<"$@"
for a in ; do echo "[$a]"; done

for file in "${arr[@]}"
do
  echo "file is " $file
  if [[ ${file} =~ \.(mscx)$ ]]; then
  	echo ${file}
  	musescore --export-to out.png ${file}
  fi
done
