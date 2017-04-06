#!/bin/sh
# Tested in FreeBSD

sudo sysctl net.inet.tcp.keepinit=1000

for i in `jot - 1 50`
do
ip=10.1.25.$i
echo "$ip `date +%H:%M:%S`" > "$ip `date  +%H%M%S`".htm
ftp -a $ip << EOF
user 11ecg5 123
put *.htm
quit
EOF
rm *.htm
done

sudo sysctl net.inet.tcp.keepinit=75000
