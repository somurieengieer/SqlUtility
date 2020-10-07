DROP PROCEDURE IF EXISTS search_all;
delimiter //
CREATE PROCEDURE search_all()
BEGIN
	-- ハンドラで利用する変数 v_done を宣言
	DECLARE v_done INT DEFAULT 0;
    -- フェッチした値を格納する変数
    DECLARE v_table_name VARCHAR(100);
    DECLARE v_column_name VARCHAR(100);
    DECLARE cur_member CURSOR FOR
		SELECT table_name FROM information_schema.tables WHERE TABLE_SCHEMA = 'SCHOOL';
    -- カーソルを開く
	SET @keyword = '佐藤';
	OPEN cur_member;
    -- 最初のカーソルをfetch
	fetch cur_member INTO v_table_name, v_column_name;
	PREPARE stmt1 FROM 'SELECT COUNT(*) FROM ? WHERE ? = ?';
	-- while関数で繰り返えさせる
	while v_done != 1 do
		-- メイン処理
		SELECT v_table_name, v_column_name FROM dual;
        SET @t_name = v_table_name;
        SET @c_name = v_column_name;
        EXECUTE stmt1 USING @t_name, @c_name, @keyword;
		-- 次のカーソルをfetch
		fetch cur_member INTO v_table_name, v_column_name;
	END while;
	-- 最後にカーソルを閉じる
	CLOSE cur_member;
END;
//
delimiter ;
CALL search_all();


SELECT table_name FROM information_schema.tables WHERE TABLE_SCHEMA = 'SCHOOL';
SELECT table_name FROM information_schema.tables WHERE TABLE_SCHEMA = 'SCHOOL';
SELECT table_name, column_name FROM information_schema.columns WHERE TABLE_SCHEMA = 'SCHOOL';
