#include "../include/database.h"
#include <stdio.h>

int main(int argc, char *argv[]) {
	createDatabase("Database 1");
	DB_TYPE type[1] = {DB_TYPE_INTEGER};
	createTable(getDB("Database 1"), "Taaaable 1", 1, 2, type);
	addColumn(getTable(getDB("Database 1"), "Taaaable 1"), DB_TYPE_BOOLEAN, -1);

	return 0;
}