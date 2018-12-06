all: leveldb-repairdb

libsnappy.a: snappy/*.cc snappy/*.h
	cd snappy && ./autogen.sh && ./configure && $(MAKE)
	cp snappy/.libs/libsnappy.a ./

libleveldb.a: leveldb/include/leveldb/*.h leveldb/db/*.c leveldb/db/*.cc leveldb/db/*.h
	cd leveldb && $(MAKE)
	cp leveldb/out-static/libleveldb.a ./

leveldb-repairdb: libsnappy.a libleveldb.a
	g++ -static -O2 -pthread -Ileveldb/include leveldb-repairdb.cpp -o leveldb-repairdb -L. -lleveldb -lsnappy

.PHONY: clean

clean:
	make -C snappy clean
	rm -f libsnappy.a
	make -C leveldb clean
	rm -f libleveldb.a
	rm -f leveldb-repairdb
