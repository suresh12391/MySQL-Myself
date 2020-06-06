##### Investigation Commands:

* SHOW ENGINE INNODB STATUS \G;
* SHOW FULL PROCESSLIST \G;
* SHOW STATUS LIKE 'open%';
* show status like '%onn%';
* show processlist;
* KILL PID;
* KILL Query PID;
* status;

##### Connections

* show status where `variable_name` = 'Threads_connected';
* SHOW STATUS WHERE `variable_name` = 'Max_used_connections';
* SELECT SUBSTRING_INDEX(USER(), '@', -1) AS MySql_ipAddress;

##### Admin

* mysqladmin -uroot -p status;
* Stil no luck, try MySQLTuner perl script


#Logs

Verify the below log files to find the root cause

* slow-query log
* mysql-error log
