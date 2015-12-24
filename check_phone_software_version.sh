#!/bin/bash
i=13000
while [ "$i" -ne "13099" ]
do
/usr/sbin/asterisk -rx "sip show peer $i" | grep  Useragent |grep Yealin && /usr/sbin/asterisk -rx "sip show peer $i" | grep Addr && echo "number = $i"

i=$(($i + 1))
done
