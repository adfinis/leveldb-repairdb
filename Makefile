all: leveldb-repairdb

libsnappy.a: snappy/*.cc snappy/*.h
	mkdir -p snappy/build
	cmake -S snappy -B snappy/build -DSNAPPY_BUILD_TESTS=OFF -DSNAPPY_BUILD_BENCHMARKS=OFF && make -C snappy/build
	cp snappy/build/libsnappy.a ./

libleveldb.a: leveldb/include/leveldb/*.h leveldb/db/*.c leveldb/db/*.cc leveldb/db/*.h
	mkdir -p leveldb/build
	cmake -S leveldb -B leveldb/build -DLEVELDB_BUILD_TESTS=OFF -DLEVELDB_BUILD_BENCHMARKS=OFF && make -C leveldb/build
	cp leveldb/build/libleveldb.a ./

leveldb-repairdb: libsnappy.a libleveldb.a
	g++ -static -O2 -pthread -Ileveldb/include leveldb-repairdb.cpp -o leveldb-repairdb -L. -lleveldb -lsnappy

.PHONY: clean

clean:
	make -C snappy/build clean
	rm -f libsnappy.a
	make -C leveldb/build clean
	rm -f libleveldb.a
	rm -f leveldb-repairdb
