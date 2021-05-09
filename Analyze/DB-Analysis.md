##### Investigation Commands:

```
* SHOW ENGINE INNODB STATUS \G;
* SHOW FULL PROCESSLIST \G;
* SHOW STATUS LIKE 'open%';
* show status like '%onn%';
* show status like 'Qc%';
* show status like '%Threads_connected%';
* show processlist;
* KILL PID;
* KILL Query PID;
* SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_TYPE='BASE TABLE';
* select * from sys.innodb_buffer_stats_by_table;
```

```
SHOW GLOBAL STATUS LIKE "Questions"
SHOW GLOBAL STATUS LIKE "Queries";
SHOW GLOBAL STATUS LIKE "Com_select";
SHOW GLOBAL STATUS LIKE "Threads_running";
SHOW GLOBAL STATUS LIKE "Slow_queries";
SHOW VARIABLES LIKE 'open_files_limit'; Ex: 102400
show variables like "table_open_cache";
show variables like "open_files_limit";

mysqladmin status;
```

Query:
```
SELECT 
  SUBSTR(digest_text, 1, 50) AS digest_text_start,
  count_star,
  avg_timer_wait,
  TRUNCATE(avg_timer_wait / 1000000000000, 6) 
FROM
  performance_schema.events_statements_summary_by_digest 
ORDER BY avg_timer_wait DESC 
LIMIT 25;
```

##### Connections

* SHOW status where `variable_name` = 'Threads_connected';
* SHOW STATUS WHERE `variable_name` = 'Max_used_connections';
* SELECT SUBSTRING_INDEX(USER(), '@', -1) AS MySql_ipAddress;
* show global status like 'opened_tables';
* show global status like 'open_tables';
* select @@table_open_cache;

##### Admin

* mysqladmin -uroot -p status;
* Still no luck, try MySQLTuner perl script


##### Sys Schema Performance

```
SELECT IF(EXISTS(SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'sys' AND TABLE_NAME = 'version' AND COLUMN_NAME = 'sys_version'), 'YES', 'NO') AS SysSchemaInstalled;
SELECT sys_version FROM sys.version;
```

Links:
* https://www.thegeekdiary.com/how-to-install-and-configure-mysql-sys-schema/
* https://github.com/mysql/mysql-sys
* https://www.percona.com/blog/2014/11/20/sys-schema-mysql-5-6-5-7/
* https://www.databasejournal.com/features/mysql/mysql-workbench-6.2-performance-reporting.html
* https://galaxydata.ru/community/calculate-table_open_cache-mysql-1138
* https://dba.stackexchange.com/questions/27328/how-large-should-be-mysql-innodb-buffer-pool-size



##### Logs

Verify the below log files to find the any suspicious behaviour in the MysQL process

* slow-query log
* mysql-error log


