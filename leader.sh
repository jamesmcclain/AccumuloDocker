#!/bin/sh

$HADOOP_PREFIX/bin/hdfs namenode -format cluster
$HADOOP_PREFIX/sbin/hadoop-daemon.sh --config $HADOOP_PREFIX/etc/hadoop --script hdfs start namenode
$HADOOP_PREFIX/sbin/yarn-daemon.sh --config $HADOOP_PREFIX/etc/hadoop start resourcemanager
$HADOOP_PREFIX/sbin/mr-jobhistory-daemon.sh --config $HADOOP_PREFIX/etc/hadoop start historyserver
$ZOOKEEPER_HOME/bin/zkServer.sh start
# $ACCUMULO_HOME/bin/accumulo init --instance-name name --password password
# $ACCUMULO_HOME/bin/start-all.sh --notSlaves
# $ACCUMULO_HOME/bin/start-server.sh localhost tserver "tablet server"
# https://ngageoint.github.io/geowave/
# docker run -it --rm -p 50095:50095 -p 8088:8088 -p 50070:50070 -p 19888:19888 -h leader --name leader --entrypoint /scripts/leader.sh accumulo:0
# docker run -it --rm -h follower1 --entrypoint /scripts/follower.sh --link leader accumulo:0
bash
