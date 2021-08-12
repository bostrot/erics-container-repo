#!/bin/sh
echo $PASSWORD | openconnect --user=$USER --passwd-on-stdin $SERVER
echo "Your IP: "
curl ifconfig.me