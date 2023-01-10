#!/bin/bash
version=$1
url=https://dlcdn.apache.org/drill/$version/apache-$version.tar.gz


sudo rm -r -f /opt/drill-files
sudo rm -r -f /opt/drill-site


sudo mkdir /opt/drill-files
cd /opt/drill-files


sudo wget $url
sudo tar -xzf apache-drill-*.tar.gz
sudo rm apache-drill-*.tar.gz


#sudo mv apache-drill-1.20.0/ /opt/

sudo ln -s /opt/drill-files/apache-$version /opt/drill


sudo mkdir /opt/drill-site



export DRILL_SITE=/opt/drill-site
export DRILL_HOME=/opt/drill


# NEED THE conf file



sudo cp $DRILL_HOME/conf/drill-env.sh $DRILL_SITE






