#!/bin/sh

mkdir -p $ACCUMULO_LOG_DIR && chown hdfs:hdfs -R $ACCUMULO_LOG_DIR
/scripts/hadoop-leader.sh
/scripts/hadoop-follower.sh
/scripts/zookeeper.sh
/scripts/accumulo-leader.sh
/scripts/accumulo-follower.sh
$ACCUMULO_HOME/bin/accumulo shell -u root -p password
