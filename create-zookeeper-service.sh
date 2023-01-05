tee /etc/systemd/system/zookeeper.service << EOF
[Unit]
Description=Zookeeper Daemon
Documentation=http://zookeeper.apache.org
Requires=network.target
After=network.target

[Service]    
Type=forking
WorkingDirectory=/opt/apache-zookeeper
User=zookeeper
Group=zookeeper
ExecStart=/opt/apache-zookeeper/bin/zkServer.sh start /opt/apache-zookeeper/conf/zoo.cfg
ExecStop=/opt/apache-zookeeper/zkServer.sh stop /opt/apache-zookeeper/conf/zoo.cfg
ExecReload=/opt/apache-zookeeper/bin/zkServer.sh restart /opt/apache-zookeeper/conf/zoo.cfg
TimeoutSec=30
Restart=on-failure

[Install]
WantedBy=default.target
EOF
