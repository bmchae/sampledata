drop table emp;

create table if not exists emp(empno int, ename string, sal int, deptno int)
row format delimited
fields terminated by ',';
--location 'file:///home/nexr/projects/sampledata/data/emp';

