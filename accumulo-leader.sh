#!/bin/sh

mkdir -p $ACCUMULO_LOG_DIR && chown hdfs:hdfs -R $ACCUMULO_LOG_DIR
su hdfs -c "$ACCUMULO_HOME/bin/accumulo init --instance-name name --password password"
su hdfs -c "nohup $ACCUMULO_HOME/bin/accumulo monitor --address 0.0.0.0 > $ACCUMULO_LOG_DIR/monitor.out 2> $ACCUMULO_LOG_DIR/monitor.err &"
su hdfs -c "nohup $ACCUMULO_HOME/bin/accumulo master --address 0.0.0.0 > $ACCUMULO_LOG_DIR/master.out 2> $ACCUMULO_LOG_DIR/master.err &"
su hdfs -c "nohup $ACCUMULO_HOME/bin/accumulo gc --address 0.0.0.0 > $ACCUMULO_LOG_DIR/gc.out 2> $ACCUMULO_LOG_DIR/gc.err &"
