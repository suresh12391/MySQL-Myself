NOTE:
=====

set @data_affected=0;

call archive_table_data('Test_Table', 'created', 100, @data_affected);


**Result:**

+-----------------------------------+--------------+
| tableName                         | affectedRows |
+-----------------------------------+--------------+
| Test_Table			    |           50 |
+-----------------------------------+--------------+
1 row in set (0.01 sec)


select @data_affected;

+----------------+
| @data_affected |
+----------------+
|             50 |
+----------------+
1 row in set (0.00 sec)


##### Other Resoure:

- https://dba.stackexchange.com/questions/15050/creating-archiving-database-for-old-data-in-mysql
- https://www.percona.com/doc/percona-toolkit/LATEST/pt-archiver.html



