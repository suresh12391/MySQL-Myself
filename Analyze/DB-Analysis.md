##### Investigation Commands:

```
* SHOW ENGINE INNODB STATUS \G;
* SHOW FULL PROCESSLIST \G;
* SHOW STATUS LIKE 'open%';
* show status like '%onn%';
* show processlist;
* KILL PID;
* KILL Query PID;
```

```
SHOW GLOBAL STATUS LIKE "Questions"
SHOW GLOBAL STATUS LIKE "Queries";
SHOW GLOBAL STATUS LIKE "Com_select";
SHOW GLOBAL STATUS LIKE "Threads_running";
SHOW GLOBAL STATUS LIKE "Slow_queries";
SHOW VARIABLES LIKE 'open_files_limit'; Ex: 102400
show status like 'Qc%';
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


##### Logs

Verify the below log files to find the root cause

* slow-query log
* mysql-error log
