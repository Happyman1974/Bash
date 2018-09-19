#!/bin/sh

for((;;))
do
tcpdump -i any -s0 port 5060 -c 1000 -w /tmp/dumpp.pcap &&

NOWDATE=`date +%d%m%y-%H-%M`
# local directory to pickup *.tgz file
DIR=/tmp/
FILE1="tftp$NOWDATE.tgz"
tar -cvzf $DIR$FILE1 /tmp/dumpp.pcap

USERNAME="user"
PASSWORD="1234"
SERVER="104.55.132.152"

# remote server directory to upload backup
BACKUPDIR="/backup_freeswitch/"

# login to remote server
ftp -n -i -v $SERVER <<EOF
user $USERNAME $PASSWORD
binary
put $DIR$FILE1 $BACKUPDIR$FILE1
quit
EOF

rm -f /tmp/dumpp.pcap

done

#email
#echo "This is the message body" | mutt -s "subject freeswitch backup" -- name@mail.ru
