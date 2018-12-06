leveldb-repairdb
================

[![License: MIT](https://img.shields.io/github/license/adfinis-sygroup/leveldb-repairdb.svg?style=flat-square)](https://github.com/adfinis-sygroup/leveldb-repairdb/blob/master/LICENSE)

This repo contains the source for a statically linked binary that repairs
leveldb databases using the official Google C++ library. Check out the
repository using `git clone --recursive` to also check out the leveldb and
snappy libraries.

Build
-----

Just run `make`, this will automatically build leveldb and snappy and build
a static binary called `leveldb-repairdb`.

Usage
-----

Change to the directory where the database that needs to be repaired resides
and execute `leveldb-repairdb`. The binary will have the returncode 0 when the
repair was successful and 1 when it failed.

Example:
```
$ cd /aptly/.aptly/db/
$ leveldb-repairdb
Repairing the database in the current directory.
Repairing the database was sucessful.
```
