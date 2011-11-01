--drop table calllog;

create table if not exists calllog(empno int, dummy1 string, dummy2 string)
row format delimited
fields terminated by ',';
--location 'file:///home/nexr/projects/sampledata/data/emp';

