select E.name, count(1)
from tab1 E join tab2 C on (E.id = C.id)
group by E.name;


select E.name, count(1)
from tab1 E
join tab2 C
where E.id = C.id
group by E.name;

