all: accumulo-1.7.1-bin.tar.gz zookeeper-3.4.8.tar.gz
	docker build -t accumulo:2 .

accumulo-1.7.1-bin.tar.gz:
	curl -C - -O 'http://apache.mirrors.hoobly.com/accumulo/1.7.1/accumulo-1.7.1-bin.tar.gz'

zookeeper-3.4.8.tar.gz:
	curl -C - -O 'http://apache.osuosl.org/zookeeper/zookeeper-3.4.8/zookeeper-3.4.8.tar.gz'
