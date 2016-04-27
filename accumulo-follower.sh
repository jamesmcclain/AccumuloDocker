#!/bin/sh

su hdfs -c "nohup $ACCUMULO_HOME/bin/accumulo tserver --address 0.0.0.0 > $ACCUMULO_LOG_DIR/tserver.out 2> $ACCUMULO_LOG_DIR/tserver.err &"
