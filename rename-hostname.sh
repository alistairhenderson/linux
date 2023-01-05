#!/bin/bash
hotsname=$1
tee /etc/hostnames <<EOF
$hostname 
EOF

echo "#deb [check-date=no] file:///cdrom focal main restricted" >> /etc/apt/sources.list

reboot
