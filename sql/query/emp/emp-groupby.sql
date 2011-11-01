select deptno, count(1) cnt
from   emp
group by deptno
