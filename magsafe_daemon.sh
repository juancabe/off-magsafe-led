#!/bin/bash

LOGFILE="/Users/user/bin/logs/magsafe_daemon.log"
MAGSAFE_COMMAND="sudo /usr/local/bin/smc -k ACLC -w 01"

rm $LOGFILE > /dev/null 2>&1
mkdir logs > /dev/null 2>&1

echo "$(date): MagSafe Daemon Runned" >> "$LOGFILE"
$MAGSAFE_COMMAND >> "$LOGFILE" 2>&1
