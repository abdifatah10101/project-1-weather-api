-- =======================================
-- Create weather_data table
-- =======================================

CREATE TABLE IF NOT EXISTS weather_data (
    id SERIAL PRIMARY KEY,
    reading_time TIMESTAMP,
    temperature NUMERIC
);