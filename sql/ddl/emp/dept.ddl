drop table dept;

create table if not exists dept(deptno int, dname string)
row format delimited
fields terminated by ',';
--location 'file:///Users/bmchae/shell/src/main/hive/data/dept';
    
