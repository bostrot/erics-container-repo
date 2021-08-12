#!/bin/sh
sleep 30
echo "\nLogging in..."
output=`ssh -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no -i /config/id_rsa user@server 'df -h && cd / && ls -l'`
telegram-send --config /config/telegram-send.conf "$output"