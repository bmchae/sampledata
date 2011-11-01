-- 1MR
select *
from a
join b on a.val1=b.val1
join c on a.val1=c.val1
join d on a.val1=d.val1
join e on a.val1=e.val1;



-- 3MR (2MR with oss-hive)
select *
from a
join b on a.val1=b.val1
join c on a.val1=c.val1
join d on a.val1=d.val1
join e on a.val2=e.val2;



-- 3MR
select *
from a
join e on a.val2=e.val2
join c on a.val1=c.val1
join d on a.val1=d.val1
join b on a.val1=b.val1;
