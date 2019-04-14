drop procedure if exists searchValueInAllTables;

delimiter //
create procedure searchValueInAllTables(IN table_schima_name varchar(255), IN keyword varchar(255))
begin
	declare v_table varchar(255);
	declare v_column varchar(255);
	declare done int default 0;
	declare cur cursor for
		select table_name, column_name from information_schema.columns where TABLE_SCHEMA=table_schima_name;
	declare continue handler for sqlstate '02000' set done=1; -- SQLSTATE 値 '02000' で「データなし」状況時にhandleし、done=1を設定する。その後のアクション「継続」をcontinueで指定
	set @keyword = keyword;
	drop table if exists WORK_DATA;
	create temporary table WORK_DATA( -- temporaryを付けると一時テーブルとして作成できる。セッションを抜けると自動でDropされる
	   	table_name varchar(255),
	   	column_name varchar(255),
	   	hit_count int
	);
	open cur;
		repeat
			fetch cur into v_table, v_column;
			if not done then
				set @sql_search=CONCAT('SELECT COUNT(*) INTO @cnt FROM ' , v_table, ' WHERE ', v_column, ' LIKE ?;');
				prepare stmt from @sql_search;
				execute stmt using @keyword; -- パラメータ値はユーザー変数でのみ提供可能
				if (@cnt > 0) then
					set @sql_add_result=CONCAT('INSERT INTO WORK_DATA VALUES(?, ?, ?)');
					prepare stmt_add_result from @sql_add_result;
					SET @v_table = v_table;
					SET @v_column = v_column;
					execute stmt_add_result using @v_table, @v_column, @cnt;
				end if;
			end if;
		until done end repeat; -- untilの後は終了条件。
	close cur;
	select * from WORK_DATA;
end
//
delimiter ;

-- 全テーブル検索
call searchValueInAllTables('db_name', '%search_keyword%');
