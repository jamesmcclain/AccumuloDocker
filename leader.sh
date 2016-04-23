#!/bin/sh

/scripts/hadoop-leader.sh
/scripts/hadoop-follower.sh
/scripts/zookeeper.sh
/scripts/accumulo-leader.sh
su hdfs -c "nohup $ACCUMULO_HOME/bin/accumulo tserver --address 0.0.0.0 > $ACCUMULO_LOG_DIR/tserver.out 2> $ACCUMULO_LOG_DIR/tserver.err &"
bash
