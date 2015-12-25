#!/bin/bash
i=13000
while [ "$i" -ne "13099" ]
do
/usr/sbin/asterisk -rx "sip show peer $i" | grep  Useragent |grep Yealin && /usr/sbin/asterisk -rx "sip show peer $i" | grep Addr && echo "number = $i"
/usr/sbin/asterisk -rx "sip show peer $i" | grep  Useragent |grep Panas && /usr/sbin/asterisk -rx "sip show peer $i" | grep Addr && echo "number = $i"
/usr/sbin/asterisk -rx "sip show peer $i" | grep  Useragent |grep Cisco && /usr/sbin/asterisk -rx "sip show peer $i" | grep Addr && echo "number = $i"
/usr/sbin/asterisk -rx "sip show peer $i" | grep  Useragent |grep AddPac && /usr/sbin/asterisk -rx "sip show peer $i" | grep Addr && echo "number = $i"

i=$(($i + 1))
done
