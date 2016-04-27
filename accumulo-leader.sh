#!/bin/sh

su hdfs -c "$ACCUMULO_HOME/bin/accumulo init --instance-name instance --password password"
su hdfs -c "nohup $ACCUMULO_HOME/bin/accumulo monitor --address 0.0.0.0 > $ACCUMULO_LOG_DIR/monitor.out 2> $ACCUMULO_LOG_DIR/monitor.err &"
su hdfs -c "nohup $ACCUMULO_HOME/bin/accumulo master --address 0.0.0.0 > $ACCUMULO_LOG_DIR/master.out 2> $ACCUMULO_LOG_DIR/master.err &"
su hdfs -c "nohup $ACCUMULO_HOME/bin/accumulo gc --address 0.0.0.0 > $ACCUMULO_LOG_DIR/gc.out 2> $ACCUMULO_LOG_DIR/gc.err &"
su hdfs -c "nohup $ACCUMULO_HOME/bin/accumulo tracer --address 0.0.0.0 > $ACCUMULO_LOG_DIR/tracer.out 2> $ACCUMULO_LOG_DIR/tracer.err &"
