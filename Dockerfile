FROM jamesmcclain/hadoop:1
MAINTAINER James McClain <james.mcclain@gmail.com>

ADD zookeeper-3.4.8.tar.gz /opt
ADD accumulo-1.7.1-bin.tar.gz /opt
ADD zoo.cfg /opt/zookeeper-3.4.8/conf
ADD conf/* /opt/accumulo-1.7.1/conf/
ADD zookeeper.sh accumulo-leader.sh accumulo-follower.sh leader.sh follower.sh /scripts/

RUN groupadd -r zookeeper && useradd -r -g zookeeper zookeeper \
    && chown zookeeper:zookeeper -R /opt/zookeeper-3.4.8/ \
    && chown hdfs:hdfs -R /opt/accumulo-1.7.1

EXPOSE 50095

ENV ZOOKEEPER_HOME /opt/zookeeper-3.4.8
ENV ACCUMULO_HOME /opt/accumulo-1.7.1
ENV ACCUMULO_LOG_DIR /tmp/logs/accumulo
