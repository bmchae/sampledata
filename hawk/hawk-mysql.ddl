--
-- Table structure for table `HAWK_HIVE_LOGS`
--
DROP TABLE IF EXISTS `HAWK_HIVE_LOGS`;
CREATE TABLE `HAWK_HIVE_LOGS` (
  `log_id` int(32) NOT NULL AUTO_INCREMENT,
  `log_type` varchar(30) DEFAULT NULL,
  `query_id` varchar(100) DEFAULT NULL,
  `task_id` varchar(30) DEFAULT NULL,
  `task_name` varchar(100) DEFAULT NULL,
  `mr_job_id` varchar(30) DEFAULT NULL,
  `dt` datetime DEFAULT NULL,
  `checked` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


--
-- Table structure for table `HAWK_HIVE_PLANS`
--
DROP TABLE IF EXISTS `HAWK_HIVE_PLANS`;
CREATE TABLE `HAWK_HIVE_PLANS` (
  `plan_id` int(32) NOT NULL AUTO_INCREMENT,
  `parent_plan_id` int(32) DEFAULT NULL,
  `query_hash` varchar(100) DEFAULT NULL,
  `xxxx` int(32) DEFAULT NULL,
  PRIMARY KEY (`plan_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


--
-- Table structure for table `HAWK_QUERY_STRINGS`
--
DROP TABLE IF EXISTS `HAWK_QUERY_STRINGS`;
CREATE TABLE `HAWK_QUERY_STRINGS` (
  `query_hash` varchar(100) NOT NULL DEFAULT '',
  `query_string` TEXT DEFAULT NULL,
  `checked` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`query_hash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


--
-- Table structure for table `HAWK_QUERY_STRING_MAPPINGS`
--
DROP TABLE IF EXISTS `HAWK_QUERY_STRING_MAPPINGS`;
CREATE TABLE `HAWK_QUERY_STRING_MAPPINGS` (
  `query_id` varchar(100) NOT NULL DEFAULT '',
  `query_hash` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`query_id`,`query_hash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


--
-- Table structure for table `HAWK_WORKS`
--
DROP TABLE IF EXISTS `HAWK_WORKS`;
CREATE TABLE `HAWK_WORKS` (
  `work_id` int(32) NOT NULL AUTO_INCREMENT,
  `work_name` varchar(100) DEFAULT NULL,
  `work_pid` int(32) DEFAULT NULL,
  `work_type_id` int(32) DEFAULT NULL,
  `start_time` datetime DEFAULT NULL,
  `finish_time` datetime DEFAULT NULL,
  PRIMARY KEY (`work_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


--
-- Table structure for table `HAWK_WORK_ATTRS`
--
DROP TABLE IF EXISTS `HAWK_WORK_ATTRS`;
CREATE TABLE `HAWK_WORK_ATTRS` (
  `attribute_id` int(32) NOT NULL AUTO_INCREMENT,
  `attribute_name` varchar(100) DEFAULT NULL,
  `description` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`attribute_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


--
-- Table structure for table `HAWK_WORK_ATTR_MAPPINGS`
--
DROP TABLE IF EXISTS `HAWK_WORK_ATTR_MAPPINGS`;
CREATE TABLE `HAWK_WORK_ATTR_MAPPINGS` (
  `work_type_id` int(32) NOT NULL DEFAULT '0',
  `attribute_id` int(32) NOT NULL DEFAULT '0',
  PRIMARY KEY (`work_type_id`,`attribute_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


--
-- Table structure for table `HAWK_WORK_ATTR_VALUES`
--
DROP TABLE IF EXISTS `HAWK_WORK_ATTR_VALUES`;
CREATE TABLE `HAWK_WORK_ATTR_VALUES` (
  `work_id` int(32) NOT NULL DEFAULT '0',
  `attribute_id` int(32) NOT NULL DEFAULT '0',
  `value` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`work_id`,`attribute_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


--
-- Table structure for table `HAWK_WORK_METRICS`
--
DROP TABLE IF EXISTS `HAWK_WORK_METRICS`;
CREATE TABLE `HAWK_WORK_METRICS` (
  `metric_id` int(32) NOT NULL AUTO_INCREMENT,
  `category_group` varchar(100) DEFAULT NULL,
  `category` varchar(100) DEFAULT NULL,
  `description` varchar(300) DEFAULT NULL,
  `statistics_method` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`metric_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


--
-- Table structure for table `HAWK_WORK_METRIC_MAPPINGS`
--
DROP TABLE IF EXISTS `HAWK_WORK_METRIC_MAPPINGS`;
CREATE TABLE `HAWK_WORK_METRIC_MAPPINGS` (
  `work_type_id` int(32) NOT NULL DEFAULT '0',
  `metric_id` int(32) NOT NULL DEFAULT '0',
  PRIMARY KEY (`work_type_id`,`metric_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


--
-- Table structure for table `HAWK_WORK_METRIC_VALUES`
--
DROP TABLE IF EXISTS `HAWK_WORK_METRIC_VALUES`;
CREATE TABLE `HAWK_WORK_METRIC_VALUES` (
  `work_id` int(32) NOT NULL DEFAULT '0',
  `metric_id` int(32) NOT NULL DEFAULT '0',
  `dt` datetime DEFAULT NULL,
  `value` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`work_id`,`metric_id`, `dt`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


--
-- Table structure for table `HAWK_WORK_TYPES`
--
DROP TABLE IF EXISTS `HAWK_WORK_TYPES`;
CREATE TABLE `HAWK_WORK_TYPES` (
  `work_type_id` int(32) NOT NULL AUTO_INCREMENT,
  `type` varchar(32) DEFAULT NULL,
  `description` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`work_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
