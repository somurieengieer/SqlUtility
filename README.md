# searchAllTable.sql
## About this
You can find all fields in all tables of database.
This is useful when you forget relationship with each tables or foreign keys between tables are still incomplete.

## Usage
-- Search all tables in database.
call searchValueInAllTables('db_name', '%search_keyword%');


# searchAllColumn.sql
## About this
You can find all fields in Table.
This is useful when you forget relationship with each tables or foreign keys between tables are still incomplete.
 
## Usage
-- Search all colum in a table.
call searchRowInTable("table_name", "%search_keyword%");
