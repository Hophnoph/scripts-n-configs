#!/bin/bash

case $1 in
  "-h" | "--help")
cat <<EOF
Playlist.sh | ./playlist.sh [args]

this is a script made to play a music list
- run this script inside the playlist directory
- or spefiy a directory
- will play MP3 with MPV media player

 Commands
  -s or --skip      | skip prompts and run Current Working Directory MP3s
  -d or --directory | ask which Directory to run MP3s inside it
  -h or --help      | print this help
EOF
    ;;
  "-s" | "--skip")
    list=$(ls)

    for i in "${list[@]}"; do
      if [[ ! -d "$i" ]]; then
        mpv "${i}"
      fi
    done

    ;;
  "-d" | "--directory")
      echo "which playlist directory do you want to play ?"
      read -r dir

      if [[ -d "$dir" ]]; then
        cd "$dir" || return
        list=$(ls)

        for i in "${list[@]}"; do
          if [[ ! -d "$i" ]]; then
            mpv "${i}"
          fi
        done
      else
        echo "'$dir' is not a directory"
      fi
    ;;
  *)
  if [[ $1 == "" ]]; then
    echo "command not found"
  else
    echo "wrong command"
  fi
    ;;
esac

