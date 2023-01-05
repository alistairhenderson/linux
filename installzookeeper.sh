zoopassword=$1
zookeeperurl=$2

apt upadate
apt -y upgrade

apt install -y openjdk-11-jdk


useradd zookeeper -m
usermod --shell /bin/bash zookeeper

echo zookeeper:$zoopassword | chpasswd

usermod -aG sudo zookeeper

mkdir -p /opt/zookeeper/data
chown -R zookeeper:zookeeper /opt/zookeeper


cd /opt/
wget $zookeeperurl

tar xvzf apache-zookeeper*.tar.gz

mv apache-zookeeper*bin apache-zookeeper

chown -R zookeeper:zookeeper /opt/apache-zookeeper

tee /opt/apache-zookeeper/conf/zoo.cfg << EOF
tickTime = 2000
dataDir = /opt/zookeeper/data
clientPort = 2181
initLimit = 5
syncLimit = 2
EOF

chown -R zookeeper:zookeeper /opt/apache-zookeeper

cd /opt/apache-zookeeper
bin/zkServer.sh start
