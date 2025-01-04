#include "../include/database.h"
#include <string.h>
#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>

STATE state = {0};

size_t getSize(DB_TYPE type) {
	switch (type) {
	case DB_TYPE_STRING:
		return DB_STRING_SIZE;
	case DB_TYPE_BOOLEAN: 
		return sizeof(bool);
	case DB_TYPE_INTEGER:
		return sizeof(int);
	}
}

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

void deleteDatabase(DB* db) {
	if (db == 0) {return;}

	if (state.num_db > 1) {
		for (int i = 0; i<state.num_db; i++) {
		deleteTable(db, (DB_TABLE*)db->database + i);
		}
	}

	if (state.num_db == 1) {
		free(state.top);
		state.top=0;
	} else {
		memmove(db, db + 1, sizeof(DB) * (state.num_db - ((int)db - (int)state.top) / sizeof(DB) + 1));
		state.top = realloc(state.top, sizeof(DB) * (state.num_db - 1));
	}

	state.num_db--;
}

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

void deleteTable(DB* db, DB_TABLE* table) {
	if (table==0 || db == 0) {return;}

	if (db->num_table > 1) {
		for (int i = 0; i<table->num_column; i++) {
		remColumn(table, i);
		}
	}

	if (db->num_table == 1) {
		free(db->database);
		db->database=0;
	} else {
		memmove(table, table + 1, sizeof(DB_TABLE) * (db->num_table - ((int)table - (int)db->database) / sizeof(DB_TABLE) + 1));
		db->database = realloc(db->database, sizeof(DB_TABLE) * (db->num_table - 1));
	}

	db->num_table--;
}

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

	memmove(column + 1, column, sizeof(DB_COLUMN) * (table->num_column - (prev_column + 2))); //does this work?

	column->type = type;
	column->content = malloc(getSize(type) * table->num_row);
}

void remColumn(DB_TABLE* table, unsigned int column) {
	if (table==0) {return;}

	//TODO: add safety checks, like checking if row to delete actually exists

	DB_COLUMN* column_struct = (DB_COLUMN*)table->table + column;
	free(column_struct->content);

	if (table->num_column == 1) {
		free(table->table);
		table->table=0;
	} else {
		memmove(column_struct, column_struct + 1, sizeof(DB_COLUMN) * (table->num_column - (++column)));
		table->table = realloc(table->table, sizeof(DB_COLUMN) * (table->num_column - 1));
	}

	table->num_column--;
}

//void addRow(DB_TABLE* table,int prev_row) {}
//void remRow(DB_TABLE* table, unsigned int row) {}

void addContent(DB_TABLE* table, unsigned int column, unsigned int row, void *content) {
	if (table==0) {return;}

	DB_COLUMN* column_struct = (DB_COLUMN*)table->table + column;
	void* db_content_ptr = ((void *)column_struct->content) + (getSize(column_struct->type) * row);
	memcpy(db_content_ptr, content, getSize(column_struct->type));
}

void addColumnContent(DB_TABLE* table, unsigned int column, void *content) {
	if (table==0) {return;}

	DB_COLUMN* column_struct = (DB_COLUMN*)table->table + column;
	memcpy(column_struct->content, content, table->num_row * getSize(column_struct->type));
}

DB_CONTENT_RET getContent(DB_TABLE* table, unsigned int column, unsigned int row) {
	//check if table is valid

	DB_CONTENT_RET content;

	DB_COLUMN* column_struct = (DB_COLUMN*)table->table + column;
	void* db_content_ptr = ((void *)column_struct->content) + (getSize(column_struct->type) * row);

	content.type = column_struct->type;
	content.content = db_content_ptr;

	return content;
}

DB_TYPE getColumnType(DB_TABLE* table, unsigned int column) {
	//check if table is valid

	DB_COLUMN* column_struct = (DB_COLUMN*)table->table + column;

	return column_struct->type;
}

void* getColumnContent(DB_TABLE* table, unsigned int column) {
	if (table==0) {return 0;}

	DB_COLUMN* column_struct = (DB_COLUMN*)table->table + column;
	return column_struct->content;
}