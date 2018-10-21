#!/bin/zsh

if [ -f file.txt ]; then
  echo "Cannot override file \"file\""
  exit 1
fi

if [ -f file.tar.part.d ]; then
  cat file.tar.part.* | tar jx
  if [ -f file.txt ]; then
    rm -rf file.tar*
    echo "The parts are decompressed into one unique file \"file.txt\""
  fi
else
  echo "You have to find the missing part"
  exit 1
fi
