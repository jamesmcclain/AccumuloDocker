all: libaccumulo.so accumulo-2.0.0-SNAPSHOT-bin.tar.gz zookeeper-3.4.8.tar.gz
	docker build -t jamesmcclain/accumulo:3 .

zookeeper-3.4.8.tar.gz:
	curl -C - -O 'http://apache.osuosl.org/zookeeper/zookeeper-3.4.8/zookeeper-3.4.8.tar.gz'

libaccumulo.so: accumulo-2.0.0-SNAPSHOT-bin.tar.gz
	tar axvf accumulo-2.0.0-SNAPSHOT-bin.tar.gz
	./accumulo-2.0.0-SNAPSHOT/bin/build_native_library.sh
	cp accumulo-2.0.0-SNAPSHOT/lib/native/libaccumulo.so .

clean:
	rm -rf ./accumulo-2.0.0-SNAPSHOT

cleaner: clean
	rm -f libaccumulo.so
