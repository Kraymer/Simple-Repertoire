#!/bin/bash
set -x

repo_path=$1
cd /github/workspace

echo "Hello " "$@"

for file in "${@:2}"
do
  echo "file is " $file
  if [[ ${file} =~ \.(mscx)$ ]]; then
  	echo ${file}
  	musescore --export-to out.png ${file}
  fi
done
