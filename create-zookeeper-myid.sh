#!/bin/bash
server_no=$1

echo $server_no >>  /opt/zookeeper/data/myid
chown -R zookeeper:zookeeper /opt/zookeeper/data/myid
