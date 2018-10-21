#!/bin/zsh

sleep $((($RANDOM%20)+1))

echo "mkdir"

mkdir -p foo/bar
mv foo/bar bar
rm -rf foo bar

echo "tar"

chmod +x tar.sh
./tar.sh

echo "untar"

chmod +x untar.sh
./untar.sh

echo "sha3 + python"

python3 sha3.py

echo "sqlite + python"

python3 sqlite.py
rm -f sqlite.db

echo "file + python"

python3 file.py
rm -f file2.txt
