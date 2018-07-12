grant select,insert,update,delete,create,drop on *.* to 'docker'@'%' identified by '123456';
GRANT REPLICATION SLAVE ON *.* to 'user'@'%' identified by '123456';
CREATE DATABASE docker;
FLUSH PRIVILEGES;
