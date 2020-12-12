##### Example:

Refer the below config property in prod machines for better performance's.

```
port = 3306
bind-address = 0.0.0.0 

[mysqld]
group_concat_max_len    = 8192  
innodb_flush_method     = O_DIRECT
innodb_log_file_size    = 8M | 805306368 | 48MB
innodb_log_buffer_size  = 8M 
innodb_additional_mem_pool_size = 20M
innodb_buffer_pool_size = 3G | 3019898880
innodb_buffer_pool_instances = 3
innodb_file_per_table 
innodb_log_group_home_dir = C://mysqlsever/mysql-data
innodb_data_home_dir = C://mysqlsever/mysql-data 
slow_query_log_file = C://mysqlsever/logs/slow-query.log 
slow_query_log

interactive_timeout     = 1200
wait_timeout            = 1200
table_open_cache        = 65536

key_buffer              = 16M
key_buffer_size         = 196M
sort_buffer_size        = 24M
bulk_insert_buffer_size = 2M
join_buffer_size        = 8M
max_connections         = 151
thread_stack            = 192K
thread_cache_size       = 8
max_heap_table_size     = 256M
tmp_table_size          = 256M

query_cache_type        = 1
query_cache_limit       = 1M | 16M
query_cache_size        = 16M | 128M

# server-id                     = 1
# log_bin                       = /var/log/mysql/mysql-bin.log
expire_logs_days                = 14
max_binlog_size                 = 100M
log_bin                         = C:/mysqlserver-data/bin.log
innodb_flush_log_at_trx_commit  = 1 | 2
sync_binlog                     = 1
binlog_format                   = ROW
log_bin_trust_function_creators = 1

[mysqldump]
quick
quote-names
max_allowed_packet = 16M

[mysql]
local-infile = 1
```

##### Reference:
- https://github.com/releem