--!hadoop fs -mkdir /user/nexr/warehouse/emp;
--!hadoop fs -put ~/shell/src/main/hive/data/emp/* /user/nexr/warehouse/emp;
--!hadoop fs -chmod g+w /user/nexr/warehouse/emp;

--drop table emp;

create table if not exists emp(empno int, ename string, sal int, deptno int)
    row format delimited
    fields terminated by ',';
    --location 'file:///home/nexr/projects/sampledata/data/emp';

