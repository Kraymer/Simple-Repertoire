#!/bin/bash
set -x

repo_path=$1
cd $repo_path

echo "Hello " "$@"

for file in "${@:2}"
do
  if [[ ${file} =~ \.(mscx)$ ]]; then
  	echo ${file}
  	musescore --export-to out.png ${file}
  fi
done
