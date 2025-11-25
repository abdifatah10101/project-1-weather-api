import json
import csv
import os 

with open('data/raw_weather.json', 'r') as file:
    raw_data = json.load(file)

times = raw_data["hourly"]["time"]
temps = raw_data["hourly"]["temperature_2m"]
paired_rows = zip(times, temps)
output_file = 'data/weather_data.csv'

# ---- CSV writing block goes here ----
with open(output_file, 'w', newline='') as file:
    writer = csv.writer(file)
    writer.writerow(["time", "temperature_2m"])

    for time_value, temp_value in paired_rows:
        writer.writerow([time_value, temp_value])

print("weather_data.csv created successfully!")
