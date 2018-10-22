#!/bin/zsh

/usr/local/setup.sh $1 $2

rm -f /usr/local/setup.sh

# Start ssh server
/usr/sbin/sshd -D
