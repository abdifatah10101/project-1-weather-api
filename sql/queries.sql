-- =======================================
-- 1. Preview first 10 rows
-- =======================================
SELECT *
FROM weather_data
LIMIT 10;


-- =======================================
-- 2. Top 10 warmest hours
-- =======================================
SELECT reading_time, temperature
FROM weather_data
ORDER BY temperature DESC
LIMIT 10 


-- =======================================
-- 3. Top 10 coldest hours
-- =======================================
SELECT reading_time, temperature
FROM weather_data
ORDER BY temperature ASC
LIMIT 10 

-- =======================================
-- 4. Daily average temperature
-- =======================================
SELECT DATE(reading_time) AS reading_date, ROUND(AVG(temperature::numeric), 2) AS avg_temp
FROM weather_data
GROUP BY reading_date
ORDER BY reading_date;

-- =======================================
-- 5. Daily min and max temperature
-- =======================================
SELECT DATE(reading_time) AS reading_date, MIN(temperature) AS min_temp, MAX(temperature) AS max_temp 
FROM weather_data 
GROUP BY reading_date 
ORDER BY reading_date;

-- =======================================
-- 6. Hour-to-hour temperature change (LAG)
-- =======================================
SELECT reading_time, temperature,
temperature - LAG(temperature) OVER (ORDER BY reading_time) AS temp_change
FROM weather_data
ORDER BY reading_time;

-- =======================================
-- 7. Warmest hour ranking per day
-- =======================================
SELECT DATE(reading_time) AS day, reading_time, temperature,
RANK() OVER (PARTITION BY DATE(reading_time)ORDER BY temperature DESC) AS temp_rank
FROM weather_data
ORDER BY day, temp_rank;

-- =======================================
-- 8. 3-hour moving average temperature
-- =======================================
SELECT reading_time, temperature,
       AVG(temperature) OVER (ORDER BY reading_time ROWS BETWEEN 2 PRECEDING AND CURRENT ROW) AS moving_avg_3hr
FROM weather_data
ORDER BY reading_time;

-- =======================================
-- 9. Daily temperature variability (STDDEV)
-- =======================================
SELECT DATE(reading_time) AS reading_date, ROUND(STDDEV(temperature::numeric), 2) AS temp_stddev
FROM weather_data
GROUP BY reading_date
ORDER BY reading_date;

-- =======================================
-- 10. Hottest hour of each day
-- =======================================
SELECT DISTINCT ON (DATE(reading_time)) DATE(reading_time) AS reading_date, reading_time, temperature
FROM weather_data
ORDER BY DATE(reading_time), temperature DESC;