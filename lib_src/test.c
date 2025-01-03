#include "../include/database.h"
#include <stdio.h>
#include <stdbool.h> 

int main(int argc, char *argv[]) {
	createDatabase("Database 1");
	DB_TYPE type[1] = {DB_TYPE_INTEGER};
	createTable(getDB("Database 1"), "Table Test", 1, 2, type);
	addColumn(getTable(getDB("Database 1"), "Table Test"), DB_TYPE_BOOLEAN, -1);

	static const int test_i = 696969;
	static const bool test_b = true;
	
	addContent(getTable(getDB("Database 1"), "Table Test"), 1, 0, &test_i);
	addContent(getTable(getDB("Database 1"), "Table Test"), 0, 0, &test_b);

	DB_TABLE* table = getTable(getDB("Database 1"), "Table Test");

	DB_CONTENT_RET content = {0};
	content = getContent(getTable(getDB("Database 1"), "Table Test"), 1, 0);

	int output_i = *(int*)content.content;

	printf("\n%d\n", output_i);

	content = getContent(getTable(getDB("Database 1"), "Table Test"), 0, 0);

	bool output_b = *(bool*)content.content;

	printf("\n%d\n", output_b);

	return 0;
}