hadoop fs -rmr /user/bmchae/warehouse
hadoop fs -mkdir /user/bmchae/warehouse
hadoop fs -chmod g+w /user/bmchae/warehouse

hadoop fs -put ./sdp-tl-130M.log /user/bmchae/warehouse/sdp_tl2

--create database cdr LOCATION '/home/bmchae/warehouse/cdr';


drop table sdp_tl2;

create table sdp_tl2 (
    transaction_id string,
    seq_num int,
    time string,
    module_type string,
    server_name string,
    server_ip string,
    object_name string,
    method_name string,
    log_type string,
    result_code string,
    counterpart_name string,
    counterpart_ip string,
    method_name2 string,
    payload string
) row format delimited fields terminated by '\t';
    
--load data inpath '/home/bmchae/warehouse/sdp-tl-130M.log' into table txlog;

select count(1) from sdp_tl2;
