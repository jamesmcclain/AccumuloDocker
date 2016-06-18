all: accumulo-2.0.0-SNAPSHOT-bin.tar.gz zookeeper-3.4.8.tar.gz
	docker build -t jamesmcclain/accumulo:3 .

zookeeper-3.4.8.tar.gz:
	curl -C - -O 'http://apache.osuosl.org/zookeeper/zookeeper-3.4.8/zookeeper-3.4.8.tar.gz'
