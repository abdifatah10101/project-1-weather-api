# 🌤️ Weather Data Pipeline (API → JSON → CSV → PostgreSQL)
![Python](https://img.shields.io/badge/Python-3.13-blue.svg)
![PostgreSQL](https://img.shields.io/badge/PostgreSQL-18-blue)
![API](https://img.shields.io/badge/API-Open--Meteo-green)
![ETL](https://img.shields.io/badge/Pipeline-ETL-yellow)

## 🚀 Project Highlights

- Built a complete ETL pipeline from scratch (API → JSON → CSV → PostgreSQL)
- Converted raw API data into a clean analytical dataset
- Designed a structured SQL table and loaded real-world weather data
- Wrote 10+ analytical SQL queries including window functions and rankings
- Followed industry-standard project structure used by Data Engineers


## 1. Project Overview

This project builds an end-to-end data pipeline that collects hourly weather data from the Open-Meteo API, saves it as raw JSON, transforms it into a clean CSV file, and loads it into a PostgreSQL database for analysis.  

The goal is to demonstrate essential Data Engineering skills, including:
- Working with external APIs
- Data extraction and transformation
- Designing SQL tables and loading structured data
- Writing analytical SQL queries
- Organizing a project with industry-standard folder structure

## 2. Tech Stack

- **Python 3.13** — Used for accessing the API and transforming data  
- **Requests** — For downloading weather data from Open-Meteo  
- **JSON & CSV modules** — For data formatting and transformation  
- **PostgreSQL 18** — For storing structured weather data  
- **pgAdmin / psql** — For running SQL commands and loading data  
- **Git & GitHub** — For version control and project documentation  
- **Virtual Environment (venv)** — For package isolation  

## 3. Project Architecture

The project follows a clean and modular ETL architecture:

project/
│
├── src/
│ ├── api_request.py # Extracts data from API and saves JSON
│ ├── transform_to_csv.py # Converts JSON to CSV
│
├── data/
│ ├── raw_weather.json # Raw API response
│ ├── weather_data.csv # Clean transformed data
│
├── sql/
│ ├── create_weather_table.sql
│ ├── load_weather_data.sql
│ ├── queries.sql
│
├── venv/ # Virtual environment
└── README.md


This structure separates extraction, transformation, and database logic to match industry-standard Data Engineering design patterns.

## 4. Step-by-Step ETL Process

### 4.1 Extract (API → JSON)
Using Python and the `requests` library, the pipeline calls the Open-Meteo API:

- Sends an HTTP GET request  
- Receives hourly weather data in JSON format  
- Saves the response to `data/raw_weather.json` for reproducibility  

### 4.2 Transform (JSON → CSV)
A transformation script parses the JSON file, extracts the hourly timestamps and temperatures, and writes them into a clean tabular format:

- Reads `raw_weather.json`
- Extracts: `time` and `temperature_2m`
- Writes all rows to `data/weather_data.csv`
- Ensures the final CSV is ready for structured loading into PostgreSQL  

### 4.3 Load (CSV → PostgreSQL)
Using PostgreSQL, the CSV is loaded into a relational table:

- `create_weather_table.sql` builds the database schema
- `load_weather_data.sql` documents how the CSV is imported
- `\copy` was used to load data client-side due to macOS permissions  

## 5. Database Schema

The PostgreSQL database contains a single fact table used for storing hourly weather measurements.

### **weather_data**

| Column        | Type        | Description                               |
|---------------|-------------|-------------------------------------------|
| id            | SERIAL      | Primary key (auto-incrementing)           |
| reading_time  | TIMESTAMP   | Date and hour of the weather reading      |
| temperature   | NUMERIC     | Recorded temperature in Celsius           |

This schema was created using `create_weather_table.sql`.

## 6. SQL Queries Included

This project includes a full suite of analytical SQL queries demonstrating:

### ✔ Aggregations
- Daily average temperature  
- Daily minimum and maximum  

### ✔ Window Functions
- Hour-to-hour temperature changes (LAG)  
- 3-hour moving average  
- Ranking hottest hours per day  

### ✔ Advanced PostgreSQL Features
- `DISTINCT ON` to return the hottest hour for each day  

All SQL scripts are stored in:  
sql/queries.sql

## 7. How to Run This Project

### 1. Clone the repository
git clone https://github.com/abdifatah10101/project-1-weather-api.git
cd "Project 1 Weather API"

### 2. Create and activate a virtual environment
python3 -m venv venv
source venv/bin/activate

### 3. Install dependencies
pip install requests
### 4. Run the ETL scripts

### Extract (API → JSON):
python src/api_request.py

### Transform (JSON → CSV):
python src/transform_to_csv.py

### 5. Create the PostgreSQL table
\i sql/create_weather_table.sql

### 6. Load the CSV into PostgreSQL
\copy weather_data (reading_time, temperature)
FROM '/Users/abdifitahmohamed/Documents/Data Engineer/Project 1 Weather API/data/weather_data.csv'
CSV HEADER;

### 7. Run all analysis SQL queries
\i sql/queries.sql

## 8. Future Improvements

- Automate daily extraction using cron, Airflow, or Prefect  
- Store data in a cloud data warehouse (Snowflake, BigQuery, Redshift)  
- Add data validation using Great Expectations  
- Build a dashboard with Power BI, Tableau, or Streamlit  
- Add more weather variables (humidity, wind speed, precipitation)  
- Integrate multiple APIs for richer datasets  
- Convert the project into a reusable ETL package  
- Add unit tests for data extraction and transformation

## 9. ER Diagram

Below is a simple entity-relationship diagram showing the structure of the `weather_data` table used in this project:

## weather_data
- id (PK) SERIAL
- reading_time TIMESTAMP
- temperature NUMERIC

This table stores hourly weather readings extracted from the Open-Meteo API.

