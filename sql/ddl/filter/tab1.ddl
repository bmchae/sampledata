drop table tab1;

create table if not exists tab1(id int, name string)
row format delimited
fields terminated by ',';

