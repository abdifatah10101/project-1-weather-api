-- =======================================
-- Load weather_data from CSV
-- =======================================

\copy weather_data (reading_time, temperature)
FROM '/Users/abdifitahmohamed/Documents/Data Engineer/Project 1 Weather API/data/weather_data.csv'
CSV HEADER;