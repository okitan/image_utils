#!/bin/bash

set -eu

input=$1
output=$2

(
  files=()
  while IFS='' read -r file; do files+=("$file"); done < <(bash -cx "find '$input' -name \*.jpg" | sort)

  for ((i = 1; i <= ${#files[@]}; i++)); do
    src=${files[i - 1]}
    dist="$output/$(printf "%03d" "$i").jpg"
    (
      set -x
      convert -strip "$src" "$dist"
    )
  done
)
