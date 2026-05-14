#!/bin/bash

case $1 in
  "--help" | -h)
    ;;
  *)
  if [[ $1 == "" ]]; then
    echo "command not found"
  else
    echo "wrong command"
  fi
    ;;
esac
