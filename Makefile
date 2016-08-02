all: libaccumulo.so accumulo-1.7.2-bin.tar.gz zookeeper-3.4.8.tar.gz
	docker build -t jamesmcclain/accumulo:7 .

zookeeper-3.4.8.tar.gz:
	curl -C - -O 'http://apache.osuosl.org/zookeeper/zookeeper-3.4.8/zookeeper-3.4.8.tar.gz'

accumulo-1.7.2-bin.tar.gz:
	curl -C - -O 'http://mirror.cc.columbia.edu/pub/software/apache/accumulo/1.7.2/accumulo-1.7.2-bin.tar.gz'

libaccumulo.so: accumulo-1.7.2-bin.tar.gz
	tar axvf accumulo-1.7.2-bin.tar.gz
	./accumulo-1.7.2/bin/build_native_library.sh
	cp accumulo-1.7.2/lib/native/libaccumulo.so .

clean:
	rm -rf ./accumulo-1.7.2

cleaner: clean
	rm -f libaccumulo.so
