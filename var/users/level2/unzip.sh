#!/bin/zsh

cat password.tar.part.* | tar jx
mv home/level2/password password
rm -rf home/level2 password.tar.part.*
