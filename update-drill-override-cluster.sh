#!/bin/bash
server1=$1
server2=$2
server3=$3

# Backup the original file
cd /opt/drill-site
sudo cp drill-override.conf drill-override.conf.bak
sudo cp drill-override.conf drill-override.conf.org

# Replace the line
sudo sed "s/localhost:2181/$server1:2181,$server2:2181,$server3:2181/" drill-override.conf.bak > drill-override.conf

# Remove the backup file
sudo rm drill-override.conf.bak
