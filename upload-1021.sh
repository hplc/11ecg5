#!/bin/sh
# Tested in FreeBSD

sudo sysctl net.inet.tcp.keepinit=1000

for i in `jot - 1 50`
do
ip=10.1.25.$i
echo "$ip `date +%H:%M:%S`" > "$ip `date  +%H%M%S`".htm
ftp -a $ip 1021<< EOF
user 11ecg5-1 123
put *.htm
quit
EOF
rm *.htm

sleep 1

echo "$ip `date +%H:%M:%S`" > "$ip `date  +%H%M%S`".html
ftp -a $ip 1021<< EOG
user 11ecg5-2 321
put *.html
quit
EOG
rm *.html
done

sudo sysctl net.inet.tcp.keepinit=75000
