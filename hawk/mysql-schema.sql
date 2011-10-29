#
# user
#
create user data;
grant all privileges on *.* to data@localhost
identified by 'data1234' with grant option;


#
# database
#
show databases;
create database dpal;
use dpal;


