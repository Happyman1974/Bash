#!/bin/bash

DATE=`date "+%d.%m.%Y.%H:%M"`

#log calls into file pcap
#/usr/sbin/tcpdump -i eth0 host 172.16.1.196 -s0 -C 1 -w /tmp/test_$DATE.pcap &  # -C 1 means 1Mb data
/usr/sbin/tcpdump -i eth0 -s0 -w /tmp/test_$DATE.pcap &  # -C 1 means 1Mb data
sleep 10m && pkill -HUP -f /usr/sbin/tcpdump

#email
echo "This is the message body" | mutt -a "/tmp/test_$DATE.pcap" -s "subject tcpdump lost" -- me@mail.ru
