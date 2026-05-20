#!/bin/bash

case "$1" in
  "--help" | "-h")
cat <<EOF
Update.sh | update.sh [args]

simple update script for: xbps, uv, flatpak, brew

keep in mind this script WILL remove 'cache' and 'orphan' packages
from each package system if possible

options
  --help    or -h | print this help
  --all     or -a | update everything
  --xbps    or -x | update xbps packages
  --brew    or -b | update homebrew packages (aka linuxbrew)
  --uv      or -v | update uv tools
  --flatpak or -f | update flatpaks packages
EOF
  ;;

  "--all" | "-a")
    flatpak update && flatpak upgrade
    flatpak uninstall --unused

    uv tool upgrade

    brew update && brew upgrade
    brew cleanup

    echo "xbps-install needs sudo"
    sudo xbps-install -Su
    echo "xbps-remove needs sudo"
    sudo xbps-remove -Oo
  ;;

  "--xbps" | "-x")
    echo "xbps-install needs sudo"
    sudo xbps-install -Su
    echo "xbps-remove needs sudo"
    sudo xbps-remove -Oo
  ;;

  "--brew" | "-b")
    brew update && brew upgrade
    brew cleanup
  ;;

  "--uv" | "-v")
    uv tool upgrade
  ;;

  "--flatpak" | "-f")
    flatpak update && flatpak upgrade
    flatpak uninstall --unused
  ;;

  *)
    if [[ "$1" == "" ]]; then
      echo "you did not spefy a command"
    else
      echo "command not found"
    fi
    ;;
esac
