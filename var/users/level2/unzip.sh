#!/bin/zsh

if [ -f password ]; then
  echo "Cannot override file \"password\""
  exit 1
fi

if [ -f password.tar.part.d ]; then
  cat password.tar.part.* | tar jx
  if [ -f password ]; then
    rm -rf password.tar.part.*
    echo "The parts are decompressed into one unique file \"password\""
  fi
else
  echo "You have to find the missing part"
  exit 1
fi



