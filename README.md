# 一時的なMySQLサーバを起動する

起動後の接続は何れも以下の通り。  
$ mysql -h 127.0.0.1 --port 43306 -uroot -ppassword

## Dockerfileで起動する

以下で起動。  
$ docker build -t mysql-dockerfile .
$ docker run -d -p 43306:3306 mysql-dockerfile

## docker-composeで起動する

現在は解消しているが、Dockerfileを書かずにdocker-composeだけで動かそうとしたところ初期データが投入されなかった。（docker-compose.ymlのvolumesは起動後にマウントされるため起動と初期化のタイミングが合っていないことが原因？）

以下で起動。  
$ docker-compose  -p 43306:3306 up --build

## シェルで起動する（dockerを直接実行）

以下で起動。  
$ ./docker_up_tmp_db_init_football.sh


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
