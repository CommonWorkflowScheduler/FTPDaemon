#!/bin/bash

if (( $# < 3 || $# % 2 == 0 )); then
  echo "Usage: $0 <command> <src1> <dest1> [<src2> <dest2> ...]" >&2
  exit 1
fi

command=$1
shift

for ((i=0; i<$#; i+=2)); do
  src="${@:$i+1:1}"
  dest="${@:$i+2:1}"
  $command "$src" "$dest" || echo "$src $dest" >&2
done