#!/bin/sh

mkdir -p /tmp/logs/zookeeper/
chown zookeeper:zookeeper -R /tmp/logs/zookeeper
(cd /tmp/ ; su zookeeper -c "$ZOOKEEPER_HOME/bin/zkServer.sh start")
