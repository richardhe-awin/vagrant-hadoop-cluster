#!/bin/bash
export DEBIAN_FRONTEND=noninteractive
apt-get install curl wget -y
apt-get update
apt-get -q -y --force-yes upgrade
wget -nv http://public-repo-1.hortonworks.com/ambari/ubuntu12/1.x/updates/1.7.0/ambari.list -O /etc/apt/sources.list.d/ambari.list
apt-key adv --recv-keys --keyserver keyserver.ubuntu.com B9733A7A07513CAD
apt-get update
apt-get -q -y --force-yes install ambari-agent

sed -i 's/hostname=localhost/hostname=hadoop-hdp-master/' /etc/ambari-agent/conf/ambari-agent.ini

service ambari-agent start
