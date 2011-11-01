#
# data put
#
hadoop fs -mkdir /user/nexr/warehouse/dept
hadoop fs -put   ../data/dept/* /user/nexr/warehouse/dept
hadoop fs -chmod g+w /user/nexr/warehouse/dept

hadoop fs -mkdir /user/nexr/warehouse/emp
hadoop fs -put   ../data/emp/* /user/nexr/warehouse/emp
hadoop fs -chmod g+w /user/nexr/warehouse/emp

hadoop fs -mkdir /user/nexr/warehouse/tab1
hadoop fs -put   ../data/filter/tab1.txt /user/nexr/warehouse/tab1
hadoop fs -chmod g+w /user/nexr/warehouse/tab1

hadoop fs -mkdir /user/nexr/warehouse/tab2
hadoop fs -put   ../data/filter/tab2.txt /user/nexr/warehouse/tab2
hadoop fs -chmod g+w /user/nexr/warehouse/tab2


#
# ddl
#
hive -f ../sql/ddl/emp/emp.ddl
hive -f ../sql/ddl/emp/dept.ddl
hive -f ../sql/ddl/filter/tab1.ddl
hive -f ../sql/ddl/filter/tab2.ddl

