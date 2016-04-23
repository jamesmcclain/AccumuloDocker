#!/bin/sh

(cd /tmp/ ; su zookeeper -c "$ZOOKEEPER_HOME/bin/zkServer.sh start")
