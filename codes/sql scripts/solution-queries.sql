---------------------------------------------
-- 1. What is the 15th most flown route? 

SELECT 
    ORIGIN,
    COUNT(ORIGIN) or_count,
    ORIGIN_CITY_NAME,
    DEST,
    COUNT(DEST) AS d_count,
    DEST_CITY_NAME
FROM
    test.flight_data_table where CANCELLED = 0.00
GROUP BY ORIGIN , DEST;

-- Ans: Rank 15:  MCO 8868    Orlando, FL ATL 8868    Atlanta, GA

---------------------------------------------
-- 2. What carrier has flown the 3rd most number of flights? How many? 

SELECT 
    CARRIER, COUNT(CARRIER) AS c_count, CANCELLED
FROM
    test.flight_data_table
WHERE
    CANCELLED = 0.00
GROUP BY CARRIER, CANCELLED;

-- Ans : EV, 727389, ExpressJet Airlines Inc.

---------------------------------------------
-- 3. What airport has the 10th longest delays? 

-- get the average delay time from all flights at their origin 
SELECT 
    ORIGIN, ORIGIN_STATE_ABR, ORIGIN_AIRPORT_ID, AVG(DEP_DELAY)
FROM
    test.flight_data_table where CANCELLED = 0
GROUP BY ORIGIN , ORIGIN_AIRPORT_ID;

-- or factoring in the DEP_DELAY_NEW
SELECT 
    ORIGIN AS airport,
    ORIGIN_STATE_ABR state,
    ORIGIN_AIRPORT_ID,
    AVG(DEP_DELAY_NEW)
FROM
    test.flight_data_table where CANCELLED = 0
GROUP BY ORIGIN , ORIGIN_AIRPORT_ID;

---------------------------------------------
-- 4. What is the second most popular day of the week to travel? Why? 

SELECT 
    DAYNAME(FL_DATE) AS DofW,
    SUM(FLIGHTS) AS NofFL
FROM
    test.flight_data_table where CANCELLED = 0.00
GROUP BY DofW;

-- Ans: Monday with 935694.00 flights in total in 2013. 


---------------------------------------------
---------------------------------------------
-- 5. What other actionable insights can we gain by leveraging the TranStats dataset?   
-- Additional queries performed :

-- --finding flight schedule with respect to cancellaton of time of departure
SELECT 
    DAYNAME(FL_DATE) AS DofW,
    SUM(FLIGHTS) AS NofFL,
    DEP_TIME AS departure
FROM
    test.flight_data_table where CANCELLED = 0.00
GROUP BY DofW, DEP_TIME;


-- --2 
SELECT 
    DAYNAME(FL_DATE) AS DofW,
    DEST_CITY_NAME,
    SUM(FLIGHTS) AS NofFL
FROM
    test.flight_data_table where (CANCELLED = 0.00 and (DEP_TIME >1800 and DEP_TIME <=2400)) 
GROUP BY DEST_CITY_NAME, DofW order by NofFL desc;

-- -- get city flight info with day
SELECT 
    DAYNAME(FL_DATE) AS DofW,
    DEST_CITY_NAME,
    SUM(FLIGHTS) AS NofFL
FROM
    test.flight_data_table
WHERE
    CANCELLED = 0.00
GROUP BY DEST_CITY_NAME , DofW
ORDER BY NofFL DESC;
