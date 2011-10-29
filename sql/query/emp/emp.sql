select count(1) 
from (
    select e.empno, e.ename, d.dname 
    from emp e join dept d 
    where d.dname = 'Accounting' and e.deptno = d.deptno) x
