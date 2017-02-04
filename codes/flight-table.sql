-- creating staging table in sql
USE `test`;
CREATE TABLE flight_data_table (
    `YEAR` VARCHAR(500) NULL,
    `MONTH` VARCHAR(500) NULL,
    `DAY_OF_MONTH` VARCHAR(500) NULL,
    `FL_DATE` VARCHAR(500) NULL,
    `AIRLINE_ID` VARCHAR(500) NULL,
    `CARRIER` VARCHAR(500)   NULL,
    `ORIGIN_AIRPORT_ID` VARCHAR(500)  NULL,
    `ORIGIN` VARCHAR(500)  NULL,
    `ORIGIN_CITY_NAME` VARCHAR(500)  NULL,
    `ORIGIN_STATE_ABR` VARCHAR(500)  NULL,
    `DEST_AIRPORT_ID` VARCHAR(500) NULL,
    `DEST` VARCHAR(500)  NULL,
    `DEST_CITY_NAME` VARCHAR(500)  NULL,
    `DEST_STATE_ABR` VARCHAR(500)  NULL,
    `DEP_TIME` VARCHAR(500)  NULL,
    `DEP_DELAY` VARCHAR(500) NULL,
    `DEP_DELAY_NEW` VARCHAR(500) NULL,
    `ARR_TIME` VARCHAR(500)  NULL,
    `ARR_DELAY` VARCHAR(500) NULL,
    `ARR_DELAY_NEW` VARCHAR(500) NULL,
    `CANCELLED` VARCHAR(500) NULL,
    `AIR_TIME` VARCHAR(500) NULL,
    `FLIGHTS` VARCHAR(500) NULL,
    `DISTANCE` VARCHAR(500) NULL
);

--------
-- extracting everything into the table using the merged file. Here
load data local infile 'file-name.csv'
INTO TABLE test.flight_data_table
fields terminated by ',' enclosed by '"'
ignore 1 lines


--------
-- Cleaning steps performed:

-- 1. add primary key
ALTER TABLE test.flight_data_table ADD `id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY;

-- 2. sample check null values
UPDATE test.flight_data_table 
 SET 
     ARR_DELAY = NULL
 WHERE
     ARR_DELAY = '' ;

-- 3. change data types
alter table test.flight_data_table 
change `YEAR` YR YEAR(4) NULL, 
change `MONTH` MTH INT(4) NULL,
change DAY_OF_MONTH DAY_OF_MONTH int(4) NULL,
change FL_DATE FL_DATE DATE NULL,
change AIRLINE_ID AIRLINE_ID INT(10) NULL,
change CARRIER CARRIER varchar(30) NULL,
change ORIGIN_AIRPORT_ID ORIGIN_AIRPORT_ID int(15) NULL,
change ORIGIN ORIGIN varchar(15) NULL,
change ORIGIN_CITY_NAME ORIGIN_CITY_NAME varchar(255) NULL,
change ORIGIN_STATE_ABR ORIGIN_STATE_ABR varchar(15) NULL,
change DEST_AIRPORT_ID DEST_AIRPORT_ID INT(15) NULL,
change DEST_CITY_NAME DEST_CITY_NAME varchar(255) NULL,
change DEST_STATE_ABR DEST_STATE_ABR varchar(15) NULL,
change DEST DEST varchar(15) NULL,
change FLIGHTS FLIGHTS float(10,2) null,
change AIR_TIME AIR_TIME float(20,2) NULL,
change CANCELLED CANCELLED float(20,2) NULL,
change ARR_DELAY_NEW ARR_DELAY_NEW float(20,2) null,
change ARR_DELAY ARR_DELAY float(20,2) default NULL,
change ARR_TIME ARR_TIME int(10) default NULL,
change DEP_DELAY_NEW DEP_DELAY_NEW float(20,2) NULL,
change DEP_DELAY DEP_DELAY FLOAT(20,2) NULL,
change DEP_TIME DEP_TIME INT(10) default null;
change DISTANCE DISTANCE float(20,2) NULL;

-----------------
-- final table looks like this:

-- Table: flight_data_table

-- Columns: --
-- YR year(4) 
-- MTH int(4) 
-- DAY_OF_MONTH int(4) 
-- FL_DATE date 
-- AIRLINE_ID int(10) 
-- CARRIER varchar(30) 
-- ORIGIN_AIRPORT_ID int(15) 
-- ORIGIN varchar(15) 
-- ORIGIN_CITY_NAME varchar(255) 
-- ORIGIN_STATE_ABR varchar(15) 
-- DEST_AIRPORT_ID int(15) 
-- DEST varchar(15) 
-- DEST_CITY_NAME varchar(255) 
-- DEST_STATE_ABR varchar(15) 
-- DEP_TIME int(10) 
-- DEP_DELAY float(20,2) 
-- DEP_DELAY_NEW float(20,2) 
-- ARR_TIME int(10) 
-- ARR_DELAY float(20,2) 
-- ARR_DELAY_NEW float(20,2) 
-- CANCELLED float(20,2) 
-- AIR_TIME float(20,2) 
-- FLIGHTS float(10,2) 
-- DISTANCE float(20,2) 
-- id int(11) AI PK



-------------------------------------
-- Sample date looks like this --

-- 2013,
-- 1,
-- 17,
-- 2013-01-17,
-- 20363,
-- `9E`,
-- 11298,
-- `DFW`,
-- `Dallas/Fort Worth, TX`,
-- `TX`,
-- 12478,
-- `JFK`,
-- `New York, NY`,
-- `NY`,
-- `1038`,
-- -7.00,
-- 0.00,
-- `1451`,
-- -14.00,
-- 0.00,
-- 0.00,
-- 175.00,
-- 1.00,
-- 1391.00,