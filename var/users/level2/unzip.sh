#!/bin/zsh

cat password.tar.part.* | tar jx
rm -rf password.tar.part.*
