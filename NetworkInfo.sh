#!/bin/bash

today=$(date +"%m_%d_%Y")

file ="NetworkInfo_$today"

touch $file.txt

ifconfig -a | tee -a $file.txt
netstat -a | tee -a $file.txt
cat /etc/resolv.conf | tee -a $file.txt
