#!/bin/bash
set -x

repo_path=$1
cd /home/runner/work/Simple-Repertoire/
cd $repo_path

echo "Hello " "$@"

for file in "${@:2}"
do
  echo "file is " $file
  if [[ ${file} =~ \.(mscx)$ ]]; then
  	echo ${file}
  	musescore --export-to out.png ${file}
  fi
done
