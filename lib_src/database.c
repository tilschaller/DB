#include "../include/database.h"
#include <string.h>
#include <stdlib.h>

STATE state = {0};

void createDatabase(char name[DB_STRING_SIZE]) {
	if (state.num_db == 0) {
		state.top = malloc(sizeof(DB));
	} else {
		state.top = realloc(state.top, sizeof(DB) * (state.num_db + 1));
	}

	DB* db_ptr = (DB*)state.top + state.num_db;
	state.num_db++;

	memset(db_ptr, 0, sizeof(DB));

	memcpy(db_ptr->name, name, DB_STRING_SIZE);
}

void deleteDatabase(DB* db) {}

void createTable(DB* db, char name[DB_STRING_SIZE], unsigned int num_column, unsigned int num_row, DB_TYPE types[0]) {
	if (db==0) {return;}

	if (db->num_table == 0) {
		db->database = malloc(sizeof(DB_TABLE));
	} else {
		db->database = realloc(db->database, sizeof(DB_TABLE) * (db->num_table + 1));
	}

	DB_TABLE* table_ptr = (DB_TABLE*)db->database + db->num_table;
	db->num_table++;

	memset(table_ptr, 0, sizeof(DB_TABLE));

	memcpy(table_ptr->name, name, DB_STRING_SIZE);

	for (int i = 0; i < num_column; i++) {
		addColumn(table_ptr, types[i], i-1);
	}
}

void deleteTable(DB* db, char name[DB_STRING_SIZE]) {}

DB* getDB(char name[DB_STRING_SIZE]) {
	for (int i = 0; i < state.num_db; i++) {
		DB* db_ptr = (DB*)state.top + i;
		if (memcmp(db_ptr->name, name, DB_STRING_SIZE) == 0) {return db_ptr;}
	}
	return 0;
}

DB_TABLE* getTable(DB* db, char name[DB_STRING_SIZE]) {
	for (int i = 0; i < db->num_table; i++) {
		DB_TABLE* table_ptr = (DB_TABLE*)db->database + i;
		if (memcmp(table_ptr->name, name, DB_STRING_SIZE) == 0) {return table_ptr;}
	}
	return 0;
}

void addColumn(DB_TABLE* table, DB_TYPE type, int prev_column) {
	if (table==0) {return;}

	if (table->num_column == 0) {
		table->table = malloc(sizeof(DB_COLUMN));
	} else {
		table->table = realloc(table->table, sizeof(DB_COLUMN) * (table->num_column + 1));
	}

	DB_COLUMN* column = (DB_COLUMN*)table->table + (prev_column + 1);
	table->num_column++;

	memmove(column + 1, column, sizeof(column) * (table->num_column - (prev_column + 2))); //does this work?

	column->type = type;
	column->column = malloc(type * table->num_row);
}

void remColumn(DB_TABLE* table, unsigned int column) {
	if (table==0) {return;}

	if (table->num_column < 2) {

	}
}