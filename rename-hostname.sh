!#/bin/bash
hostname=$1
tee /etc/hostname <<EOF
${hostname} 
EOF

echo "#deb [check-date=no] file:///cdrom focal main restricted" > /etc/apt/sources.list

reboot
