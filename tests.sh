#!/bin/zsh

rand(){
  n=$((($RANDOM%20)+1))
  return $n
}

rand_sleep(){
  rand
  sleep $?
}
echo "\n"
ip addr # net interfaces
rand_sleep

dig ANY isc.org @8.8.8.8 # dns lookup of isc.org using google dns
rand_sleep

host www.google.fr # ns lookup of google
rand_sleep

tcpdump -A -c 20 -vv # capture 10 network packets
rand_sleep

traceroute www.centralesupelec.fr 
rand_sleep

ip="www.centralesupelec.fr"

nmap -A $ip/24
rand_sleep
nmap --traceroute -A -sV -CV -v $ip/24
