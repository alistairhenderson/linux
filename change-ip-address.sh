#!/bin/bash

ip=$1

tee /etc/netplan/00-installer-config.yaml  << EOF

# This is the network config written by 'subiquity'
network:
  ethernets:
    enp0s3:
      dhcp4: true
    enp0s8:
            #dhcp4: true
            addresses:
                - $ip/16
            routes:
                - to: default
                  via: 10.50.0.30
            nameservers:
                  search: [radius-systems-ads]
                  addresses: [10.50.1.50, 10.50.1.51]
  version: 2
EOF

netplan apply
