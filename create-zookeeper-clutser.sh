#!/bin/bash
  
ip1=$1
host1=$2
ip2=$3
host2=$4
ip3=$5
host3=$6

tee -a /etc/hosts << EOF
${ip1} ${host1}
${ip2} ${host2}
${ip3} ${host3}
EOF


tee -a /opt/apache-zookeeper/conf/zoo.cfg << EOF
server.1=[${host1}]:2888:3888
server.2=[${host2}]:2888:3888
server.3=[${host3}]:2888:3888
EOF
