drop procedure if exists searchRowInTable;

delimiter //
create procedure searchRowInTable(IN i_table_name varchar(255), IN i_keyword varchar(255))
begin
	declare v_column varchar(255);
	declare done int default 0;
	declare row_num int default 0;
	declare cur cursor for
		select column_name from information_schema.columns where table_name=i_table_name;
	declare continue handler for sqlstate '02000' set done=1;
	
	set @sql_search=CONCAT('SELECT * FROM ', i_table_name, ' WHERE ');
	open cur;
		repeat
			fetch cur into v_column;
			if not done then
				if (row_num > 0) then
					set @sql_search=CONCAT(@sql_search, ' OR');
				end if;
				set @sql_search=CONCAT(@sql_search, ' ', v_column, ' LIKE "', i_keyword, '"');
			end if;
			set row_num = row_num + 1;
		until done end repeat;
	close cur;
	prepare sql_stmt from @sql_search;
	execute sql_stmt;
end
//
delimiter ;

-- テーブル内全検索
call searchRowInTable("table_name", "%search_keyword%");
