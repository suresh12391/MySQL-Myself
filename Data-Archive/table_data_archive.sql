USE `dbName`;
DROP procedure IF EXISTS `archive_table_data`;

DELIMITER $$
USE `dbName`$$
CREATE DEFINER=`root`@`%` PROCEDURE `archive_table_data`(IN in_table VARCHAR(128), IN in_date_column VARCHAR(16), IN in_data_span INT, OUT out_affected_rows INT)
BEGIN

    	## variables
	DECLARE source_db VARCHAR(32) DEFAULT 'dbName';
	DECLARE target_db VARCHAR(32) DEFAULT 'dbNameArchive';
    	DECLARE date_column VARCHAR(16) DEFAULT 'created';
	DECLARE calculated_date DATE DEFAULT DATE(DATE_SUB(NOW(), INTERVAL 90 DAY));
	DECLARE allowed_tables VARCHAR(2048) DEFAULT 'table_abc,table_xyz';

        ## check if input_table are allowed or not. Requested table `in_table` is not allowed for archive process...
	IF(INSTR(in_table, allowed_tables) = 0) THEN 
		SIGNAL SQLSTATE '45000'	SET MESSAGE_TEXT = 'Requested table is not allowed for archive process...';
	END IF;
	
	## data span check
	IF in_data_span > 90 THEN
		SET calculated_date = DATE(DATE_SUB(CURDATE(), INTERVAL in_data_span DAY));
	END IF;
    
    	## date_column check
	IF LENGTH(in_date_column) > 0 THEN
		SET date_column = in_date_column;
	END IF;
  
	START TRANSACTION;
  
		## "INSERT INTO `target_db`.`in_table` SELECT * FROM `source_db`.`in_table` WHERE DATE(created) < calculated_date;"
		SET @query = CONCAT('INSERT INTO `', target_db, '`.`', in_table, '` SELECT * FROM `', source_db, '`.`', in_table, '` WHERE DATE(`', date_column, '`) < "', calculated_date ,'";');

        ## insert into test_debug values (@query);

		## Data Archive Query Execution
		PREPARE runtime_stmt FROM @query;
		EXECUTE runtime_stmt;
        
SELECT ROW_COUNT() INTO out_affected_rows;
		DEALLOCATE PREPARE runtime_stmt;
               
        
        ## "DELETE FROM `source_db`.`in_table` WHERE DATE(created) < calculated_date;"
		SET @query = CONCAT('DELETE FROM `', source_db, '`.`', in_table, '` WHERE DATE(`', date_column, '`) < "', calculated_date ,'";');
		
        ## insert into test_debug values (@query);
        
        ## Delete Archived Data Query Execution
		PREPARE del_stmt FROM @query;
		EXECUTE del_stmt;
        
SELECT in_table AS 'tableName', ROW_COUNT() AS 'affectedRows';
		DEALLOCATE PREPARE del_stmt;

	COMMIT;
	

END$$

DELIMITER ;


