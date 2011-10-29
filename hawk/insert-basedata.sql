-- HAWK_WORKS_TYPES
insert into HAWK_WORK_TYPES values(1, "HIVE_JOB", "Hive Query Job type");
insert into HAWK_WORK_TYPES values(2, "HIVE_STAGE", "Hive Query Stage type");
insert into HAWK_WORK_TYPES values(3, "MR_JOB", "Hadoop MR Job type");
insert into HAWK_WORK_TYPES values(4, "MR_MAP_TASK", "Hadoop MR Map Task type");
insert into HAWK_WORK_TYPES values(5, "MR_REDUCE_TASK", "Hadoop MR Reduce Task type");

-- HAWK_WORK_METRICS
insert into HAWK_WORK_METRICS values(1, 'org.apache.hadoop.mapred.Task$Counter', 'MAP_INPUT_RECORDS', '', '');
insert into HAWK_WORK_METRICS values(2, 'org.apache.hadoop.mapred.Task$Counter', 'MAP_OUTPUT_RECORDS', '', '');
insert into HAWK_WORK_METRICS values(3, 'org.apache.hadoop.mapred.Task$Counter', 'MAP_INPUT_BYTES', '', '');
insert into HAWK_WORK_METRICS values(4, 'org.apache.hadoop.mapred.Task$Counter', 'MAP_OUTPUT_BYTES', '', '');
insert into HAWK_WORK_METRICS values(5, 'org.apache.hadoop.mapred.Task$Counter', 'COMBINE_INPUT_RECORDS', '', '');
insert into HAWK_WORK_METRICS values(6, 'org.apache.hadoop.mapred.Task$Counter', 'COMBINE_OUTPUT_RECORDS', '', '');
insert into HAWK_WORK_METRICS values(7, 'org.apache.hadoop.mapred.Task$Counter', 'REDUCE_SHUFFLE_BYTES', '', '');
insert into HAWK_WORK_METRICS values(8, 'org.apache.hadoop.mapred.Task$Counter', 'REDUCE_INPUT_RECORDS', '', '');
insert into HAWK_WORK_METRICS values(9, 'org.apache.hadoop.mapred.Task$Counter', 'REDUCE_OUTPUT_RECORDS', '', '');
insert into HAWK_WORK_METRICS values(10, 'FileSystemCounters', 'FILE_BYTES_READ', '', '');
insert into HAWK_WORK_METRICS values(11, 'FileSystemCounters', 'HDFS_BYTES_READ', '', '');
insert into HAWK_WORK_METRICS values(12, 'FileSystemCounters', 'FILE_BYTES_WRITTEN', '', '');
insert into HAWK_WORK_METRICS values(13, 'FileSystemCounters', 'HDFS_BYTES_WRITTEN', '', '');
insert into HAWK_WORK_METRICS values(14, 'SYSTEM', 'PROGRESS', '', '');
insert into HAWK_WORK_METRICS values(15, 'SYSTEM', 'T_NUM', '', '');
insert into HAWK_WORK_METRICS values(16, 'SYSTEM', 'R_NUM', '', '');
insert into HAWK_WORK_METRICS values(17, 'SYSTEM', 'C_NUM', '', '');

-- HAWK_WORK_METRIC_MAPPINGS
insert into HAWK_WORK_METRIC_MAPPINGS values(3, 14);
insert into HAWK_WORK_METRIC_MAPPINGS values(4, 1);
insert into HAWK_WORK_METRIC_MAPPINGS values(4, 2);
insert into HAWK_WORK_METRIC_MAPPINGS values(4, 3);
insert into HAWK_WORK_METRIC_MAPPINGS values(4, 4);
insert into HAWK_WORK_METRIC_MAPPINGS values(4, 5);
insert into HAWK_WORK_METRIC_MAPPINGS values(4, 6);
insert into HAWK_WORK_METRIC_MAPPINGS values(4, 10);
insert into HAWK_WORK_METRIC_MAPPINGS values(4, 11);
insert into HAWK_WORK_METRIC_MAPPINGS values(4, 12);
insert into HAWK_WORK_METRIC_MAPPINGS values(4, 13);
insert into HAWK_WORK_METRIC_MAPPINGS values(4, 14);
insert into HAWK_WORK_METRIC_MAPPINGS values(4, 15);
insert into HAWK_WORK_METRIC_MAPPINGS values(4, 16);
insert into HAWK_WORK_METRIC_MAPPINGS values(4, 17);
insert into HAWK_WORK_METRIC_MAPPINGS values(5, 7);
insert into HAWK_WORK_METRIC_MAPPINGS values(5, 8);
insert into HAWK_WORK_METRIC_MAPPINGS values(5, 9);
insert into HAWK_WORK_METRIC_MAPPINGS values(5, 10);
insert into HAWK_WORK_METRIC_MAPPINGS values(5, 11);
insert into HAWK_WORK_METRIC_MAPPINGS values(5, 12);
insert into HAWK_WORK_METRIC_MAPPINGS values(5, 13);
insert into HAWK_WORK_METRIC_MAPPINGS values(5, 14);
insert into HAWK_WORK_METRIC_MAPPINGS values(5, 15);
insert into HAWK_WORK_METRIC_MAPPINGS values(5, 16);
insert into HAWK_WORK_METRIC_MAPPINGS values(5, 17);
