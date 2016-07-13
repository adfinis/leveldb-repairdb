#include <iostream>
#include <unistd.h>
#include "leveldb/db.h"
using namespace std;

int main() {
    leveldb::Options options;
    char cwd[2048];
                   
    getcwd(cwd, sizeof(cwd));

	cout << "Repairing the database in the current directory." << endl;
    leveldb::Status status = leveldb::RepairDB(cwd, options);

    if (status.ok()) {
        cerr << "Repairing the database was sucessful." << endl;
        return 0;
    } else {
        cerr << "Repairing the database failed." << endl;
        return 1;
    }
}
