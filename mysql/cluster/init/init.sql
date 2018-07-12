grant select on *.* to 'docker'@'%' identified by '123456';
change master to master_host='master',master_user='user',master_password='123456',master_log_file='mysql-bin.000001',master_log_pos=0,master_port=3306;
start slave;

