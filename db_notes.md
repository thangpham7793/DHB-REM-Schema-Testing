https://stackoverflow.com/questions/33001750/connect-to-mysql-in-a-docker-container-from-the-host

From outside
mysql -h localhost -P 3306 --protocol=tcp -u root

need to change authentication to native_password to connect from outside

alter user test@'%' identified with mysql_native_password by "test";

need to use tcp as well
mysql -h localhost --protocol=tcp -u test -ptest
