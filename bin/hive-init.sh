#
# data put
#
hadoop fs -mkdir /user/nexr/warehouse/dept
hadoop fs -put   ../data/dept/* /user/nexr/warehouse/dept
hadoop fs -chmod g+w /user/nexr/warehouse/dept

hadoop fs -mkdir /user/nexr/warehouse/emp
hadoop fs -put   ../data/emp/* /user/nexr/warehouse/emp
hadoop fs -chmod g+w /user/nexr/warehouse/emp

#
# ddl
#
hive -f ../sql/ddl/emp/emp.ddl
hive -f ../sql/ddl//emp/dept.ddl

