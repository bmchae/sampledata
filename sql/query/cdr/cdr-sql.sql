--------------------------------------------------------------------------------
-- sum ~ decode
--------------------------------------------------------------------------------
select module_type, 
       server_name,
       method_name,
       sum(case result_code when '0' then 1 else 0 end) success,
       sum(case result_code when '0' then 0 else 1 end) fail
from   sdp_tl2
group by module_type, server_name, method_name;


--------------------------------------------------------------------------------
-- udf
-- hive> add jar hive-udf-1.0.jar
-- create temporary function rank as 'com.nexrcorp.hive.udaf.Rank';
--------------------------------------------------------------------------------
select module_type, 
       server_name,
       method_name,
       sum(case result_code when '0' then 1 else 0 end) success,
       sum(case result_code when '0' then 0 else 1 end) fail
from   sdp_tl2
group by module_type, server_name, method_name;


--------------------------------------------------------------------------------
--
--------------------------------------------------------------------------------


--------------------------------------------------------------------------------
--
--------------------------------------------------------------------------------
select transaction_id, seq_num, row_number(transaction_id) --, sum(transaction_id)
from (
	select transaction_id, seq_num
	from   sdp_tl2
	distribute by transaction_id sort by transaction_id, seq_num desc
	limit 100) A;


--------------------------------------------------------------------------------
--
--------------------------------------------------------------------------------


--------------------------------------------------------------------------------
--
--------------------------------------------------------------------------------


--------------------------------------------------------------------------------
--
--------------------------------------------------------------------------------


--------------------------------------------------------------------------------
--
--------------------------------------------------------------------------------
select transaction_id, seq_num, row_number(transaction_id) --, sum(transaction_id)
from (
    select transaction_id, seq_num
    from   sdp_tl2
    distribute by transaction_id sort by transaction_id, seq_num desc
    limit 100) A;



--------------------------------------------------------------------------------
-- ¾È¿µ¹è 
--------------------------------------------------------------------------------
explain 
select 
    module_type, server_name, sum(count_success1), sum(count_failed1), sum(count1),
    sum(res_time) AS sum_res_time, count(res_time) AS count_res_time, max(res_time) AS max_res_time
from (
    select 
        module_type, server_name, transaction_id, 
        --diffvalue1(seq_num, time) AS res_time, 
        sum(seq_num) res_time,
        sum(if(result_code = '0', 1, 0)) AS count_success1, sum(if(result_code = '0', 0, 1)) AS count_failed1, sum(1) AS count1
    from sdp_tl2
    where to_date(time)='2011-03-10' and hour(time)=11 and minute(time)=14
    group by module_type, server_name, transaction_id
) tmp_tr_res 
group by module_type, server_name
order by module_type, server_name;


--------------------------------------------------------------------------------
-- ±è¹Î¿ì 
--------------------------------------------------------------------------------
explain
select 
    t4.module_type,t4.server_name,sum(t4.success),sum(t4.fail),sum(t4.total),
    sum(t4.success)/sum(t4.total)*100,sum(t4.fail)/sum(t4.total)*100,
    avg(abs(response_time)),max(response_time),min(response_time)
from
    (select 
        t3.transaction_id, t3.module_type, t3.server_name, t3.success, t3.fail, t3.success+t3.fail as total, 
        abs(unix_timestamp(sdp_tl2.time)-t3.start_time) as response_time
    from 
        sdp_tl2
    join
        (select t2.*,unix_timestamp(sdp_tl2.time) as start_time
        from 
            sdp_tl2
        join
            (select 
                t1.transaction_id,t1.module_type,t1.server_name,
                sum(t1.success) as success,sum(t1.fail) as fail,
                min(t1.seq_num) as min_seq,max(t1.seq_num) as max_seq
            from 
                (select *,(case when result_code=0 then 1 else 0 end) as success,
                    (case when result_code=0 then 0 else 1 end) as fail from sdp_tl2) t1 
            group by
                t1.transaction_id,t1.module_type,t1.server_name
            ) t2
        on (sdp_tl2.transaction_id=t2.transaction_id AND sdp_tl2.seq_num=t2.min_seq)
        ) t3
    on
        (sdp_tl2.transaction_id=t3.transaction_id AND sdp_tl2.seq_num=t3.max_seq)
    ) t4
group by t4.module_type,t4.server_name;


--------------------------------------------------------------------------------
-- ¼öÁ¤
--------------------------------------------------------------------------------
explain
select 
    module_type, server_name, sum(success), sum(fail), sum(total),
    sum(t4.success)/sum(t4.total)*100,sum(t4.fail)/sum(t4.total)*100,
    avg(abs(response_time)), max(response_time), min(response_time)
from
    (select 
        t1.transaction_id, t1.module_type, t1.server_name, t1.success, t1.fail, 
        t1.success+t1.fail as total, 
        abs(unix_timestamp(t2.time)-unix_timestamp(t3.time)) as response_time
    from 
        (select 
            transaction_id, module_type, server_name,
            sum(case when result_code=0 then 1 else 0 end) as success,
            sum(case when result_code=0 then 0 else 1 end) as fail,
            min(seq_num) as min_seq, max(seq_num) as max_seq
        from sdp_tl2
        group by transaction_id, module_type, server_name
        ) t1
    join sdp_tl2 t2 on (t1.transaction_id=t2.transaction_id AND t1.max_seq=t2.seq_num)
    join sdp_tl2 t3 on (t1.transaction_id=t3.transaction_id AND t1.min_seq=t3.seq_num)) t4
group by module_type, server_name;


--------------------------------------------------------------------------------
-- simple
--------------------------------------------------------------------------------
explain extended
from emp
insert overwrite table emp
select deptno, 'aa', sum(sal), deptno group by deptno
order by deptno desc;


