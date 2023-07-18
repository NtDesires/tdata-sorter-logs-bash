#!/bin/bash

sourcedir="$1"
destdir="$2"

count=1

copy_tdata() {

  local dir="$1"

  if [[ $(basename "$dir") == "tdata" ]]; then

    dest="$destdir/tdata-$count"

    echo "Копирую $dir в $dest"

    cp -r "$dir" "$dest"

    count=$((count + 1))

  fi

  for d in "$dir"/*; do
    if [ -d "$d" ]; then
      copy_tdata "$d"
    fi
  done

}

copy_tdata "$sourcedir"

echo "Готово"
