#!/bin/sh

NOWDATE=`date +%d%m%y`
# local directory to pickup *.tgz file
DIR=/tmp/backup/
FILE1="tftp$NOWDATE.tgz"
tar -cvzf $DIR$FILE1 /tftpboot

FILE2="fop2$NOWDATE.tgz"
tar -cvzf $DIR$FILE2 /usr/local/fop2/

FILE3="home$NOWDATE.tgz"
tar -cvzf $DIR$FILE3 /home/sergey/

FILE4="asterisk$NOWDATE.tgz"
tar -cvzf $DIR$FILE4 /etc/asterisk/

USERNAME="name"
PASSWORD="password"
SERVER="10.5.132.1"

# remote server directory to upload backup
BACKUPDIR="/backup_101256/"

# login to remote server
ftp -n -i -v $SERVER <<EOF
 user $USERNAME $PASSWORD
 put $DIR$FILE1 $BACKUPDIR$FILE1
 put $DIR$FILE2 $BACKUPDIR$FILE2
 put $DIR$FILE3 $BACKUPDIR$FILE3
 put $DIR$FILE4 $BACKUPDIR$FILE4
 quit
EOF

#email
echo "This is the message body" | mutt -s "subject 10.1.2.56 backup" -- my@mail.ru
