FROM jamesmcclain/hadoop:0

ADD zookeeper-3.4.8.tar.gz /opt
ADD accumulo-1.7.1-bin.tar.gz /opt
ADD zoo.cfg /opt/zookeeper-3.4.8/conf

RUN chown hdfs:hdfs -R /opt/zookeeper-3.4.8/ \
    && chown hdfs:hdfs -R /opt/accumulo-1.7.1

USER hdfs

ENV ZOOKEEPER_HOME /opt/zookeeper-3.4.8
ENV ACCUMULO_HOME /opt/accumulo-1.7.1
ENV ACCUMULO_LOG_DIR /tmp/logs/accumulo
