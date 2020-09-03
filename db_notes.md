https://stackoverflow.com/questions/33001750/connect-to-mysql-in-a-docker-container-from-the-host

From outside
mysql -h localhost -P 3306 --protocol=tcp -u root

need to change authentication to native_password to connect from outside

alter user test@'%' identified with mysql_native_password by "test";

need to use tcp as well
mysql -h localhost --protocol=tcp -u test -ptest

need to grant SUPER privilege to create TRIGGER
https://dba.stackexchange.com/questions/63404/how-to-grant-super-privilege-to-the-user

can't TRUNCATE a referenced table as FK, need to use DELETE
