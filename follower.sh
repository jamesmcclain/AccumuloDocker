#!/bin/sh

mkdir -p $ACCUMULO_LOG_DIR && chown hdfs:hdfs -R $ACCUMULO_LOG_DIR
/scripts/hadoop-follower.sh
/scripts/accumulo-follower.sh
bash
