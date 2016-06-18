FROM jamesmcclain/hadoop:1
MAINTAINER James McClain <james.mcclain@gmail.com>

ADD zookeeper-3.4.8.tar.gz /opt
ADD accumulo-2.0.0-SNAPSHOT-bin.tar.gz /opt
ADD zoo.cfg /opt/zookeeper-3.4.8/conf/
ADD conf/* /opt/accumulo-2.0.0-SNAPSHOT/conf/
ADD libaccumulo-2.0.0-SNAPSHOT.so /opt/accumulo-2.0.0-SNAPSHOT/lib/native/libaccumulo.so
ADD zookeeper.sh accumulo-leader.sh accumulo-follower.sh leader.sh follower.sh /scripts/

RUN groupadd -r zookeeper && useradd -r -g zookeeper zookeeper \
    && chown zookeeper:zookeeper -R /opt/zookeeper-3.4.8/ \
    && chown hdfs:hdfs -R /opt/accumulo-2.0.0-SNAPSHOT

EXPOSE 9995

ENV ZOOKEEPER_HOME /opt/zookeeper-3.4.8
ENV ACCUMULO_HOME /opt/accumulo-2.0.0-SNAPSHOT
ENV ACCUMULO_LOG_DIR /tmp/logs/accumulo

CMD ["/scripts/leader.sh"]
