#ifndef DATABASE
#define DATABASE

#define DB_STRING_SIZE 10

typedef enum {
	DB_TYPE_STRING = DB_STRING_SIZE,
	DB_TYPE_BOOLEAN = sizeof(_Bool),
	DB_TYPE_INTEGER = sizeof(int),
} DB_TYPE;

typedef struct {
	DB_TYPE type;
	void *column;
} DB_COLUMN;

typedef struct {
	char name[DB_STRING_SIZE];
	unsigned int num_column;
	unsigned int num_row;
	void *table;
} DB_TABLE;

typedef struct {
	char name[DB_STRING_SIZE];
	unsigned int num_table;
	void *database;
} DB;

typedef struct {
	unsigned int num_db;
	void* top;
} STATE;

typedef struct {
	DB_TYPE type;
	void* content;
} DB_CONTENT;

//name maximally 10 char long
void createDatabase(char name[DB_STRING_SIZE]);
void deleteDatabase(DB* db);
void createTable(DB* db, char name[DB_STRING_SIZE], unsigned int num_column, unsigned int num_row, DB_TYPE types[0]);
void deleteTable(DB* db, char name[DB_STRING_SIZE]);

DB* getDB(char name[DB_STRING_SIZE]);
DB_TABLE* getTable(DB* db, char name[DB_STRING_SIZE]);

void addColumn(DB_TABLE* table, DB_TYPE type,int prev_column);
void remColumn(DB_TABLE* table, unsigned int column);
void addRow(DB_TABLE* table,int prev_row);
void remRow(DB_TABLE* table, unsigned int row);

void addContent();
void addRowContent();
void addColumnContent();

DB_CONTENT getContent();

void* getRowContent();
void* getColumnContent();

#endif