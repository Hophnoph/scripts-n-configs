#!/bin/bash

set -e

SCRIPT_NAME="$(basename "$0")"

case "$1" in
  "-h" | "--help")
cat <<EOF
Playlist Maker | playlist-maker.sh [args] 

a simple script made to make an m3u playlist file
depending on the media that exists in the Current Working Directory
or a specified target directory instead

WARNING: this script will include all files in CWD or Target directory
so make sure you only put videos/music file formats rather than anything else
this way your playlist dosen't have an executable file or anything unwanted

Arguments
  --help      or -h | print this help
  --start     or -s | start making a playlist
  --directory or -d | specify a target direcotry
EOF
    ;;

  "--start" | "-s")
    echo -n "Name your Playlist: "
    read -r playlist_name

    touch "${playlist_name}".m3u

    cwd_files_n_dirs=( *)
    cwd_files=()

    for i in "${cwd_files_n_dirs[@]}"; do
      if [[ -f "$i" ]]; then
        cwd_files+=("$i")
      fi
    done

    for i in "${cwd_files[@]}"; do
      if [[ "$i" != "${playlist_name}".m3u && "$i" != "$SCRIPT_NAME" ]]; then
        echo "$i" >> "${playlist_name}".m3u
      fi
    done    

    echo "Done: your playlist is ready!"
    ;;

  "--directory" | "-d")
    echo -n "target directory ? (don't end it with a forward slash '/'): "
    read -r target_dir

    echo
    echo -n "Name your Playlist: "
    read -r playlist_name

    touch "${playlist_name}".m3u

    target_files_n_dirs=( "$target_dir"/* )
    target_files=()

    for i in "${target_files_n_dirs[@]}"; do
      if [[ -f "$i" ]]; then
        target_files+=("$i")
      fi
    done

    for i in "${target_files[@]}"; do
      if [[ "$i" != "${playlist_name}".m3u && "$i" != "$SCRIPT_NAME" ]]; then
        echo "$i" >> "${playlist_name}".m3u
      fi
    done    

    echo "Done: your playlist is ready!"
    ;;

  *)
  if [[ "$1" == "" ]]; then
    echo "YOU did not specify a command ?"
  else
    echo "YOUR command wasn't found !"
  fi
    ;;
esac
