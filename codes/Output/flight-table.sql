USE `seo_bluesite_db`;
CREATE TABLE flight_data_table (
    s_no INT AUTO_INCREMENT NOT NULL,
    YR INT(5) NOT NULL,
    MTH INT(5) NOT NULL,
    DAY_OF_MONTH INT(10) NULL,
    FL_DATE INT(10) NULL,
    AIRLINE_ID INT(10) NULL,
    CARRIER VARCHAR(50) NULL,
    ORIGIN_AIRPORT_ID INT(10) NULL,
    ORIGIN VARCHAR(6) not NULL,
    ORIGIN_CITY_NAME VARCHAR(50) COLLATE UTF8_UNICODE_CI NULL,
    ORIGIN_STATE_ABR VARCHAR(50) COLLATE UTF8_UNICODE_CI NULL,
    DEST_AIRPORT_ID INT(10) NULL,
    DEST VARCHAR(50) COLLATE UTF8_UNICODE_CI NULL,
    DEST_CITY_NAME VARCHAR(50) COLLATE UTF8_UNICODE_CI NULL,
    DEST_STATE_ABR VARCHAR(50) COLLATE UTF8_UNICODE_CI NULL,
    DEP_TIME INT(10) NULL,
    DEP_DELAY INT(10) NULL,
    DEP_DELAY_NEW INT(10) NULL,
    ARR_TIME INT(10) NULL,
    ARR_DELAY INT(10) NULL,
    ARR_DELAY_NEW INT(10) NULL,
    CANCELLED INT(10) NULL,
    AIR_TIME INT(10) NULL,
    FLIGHTS VARCHAR(15) COLLATE UTF8_UNICODE_CI NULL,
    DISTANCE VARCHAR(15) COLLATE UTF8_UNICODE_CI NULL,
    PRIMARY KEY (s_no)
);