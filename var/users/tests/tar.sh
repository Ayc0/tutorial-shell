#!/bin/zsh

tar -cjf file.tar file.txt
split -b 50 -a 1 file.tar "file.tar.part."
rm -f file.txt
