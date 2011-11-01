--!hadoop fs -mkdir /user/bmchae/warehouse/dept;
--!hadoop fs -put ~/shell/src/main/hive/data/dept/* /user/bmchae/warehouse/dept;
--!hadoop fs -chmod g+w /user/bmchae/warehouse/dept;

--drop table dept;

create table if not exists dept(deptno int, dname string)
    row format delimited
    fields terminated by ',';
    --location 'file:///Users/bmchae/shell/src/main/hive/data/dept';
    
