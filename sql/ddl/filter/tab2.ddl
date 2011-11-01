drop table tab2;

create table if not exists tab2(id int, name string)
row format delimited
fields terminated by ',';

