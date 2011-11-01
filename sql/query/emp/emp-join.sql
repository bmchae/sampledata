select dname, count(1) cnt
from (
  select e.empno, e.ename, d.dname 
  from emp e join dept d on (e.deptno = d.deptno)) X
group by dname
