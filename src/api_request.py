import requests
import json
import os

url = "https://api.open-meteo.com/v1/forecast?latitude=35&longitude=139&hourly=temperature_2m"
response = requests.get(url) 
data = response.json()
with open("data/raw_weather.json", "w") as file:
    json.dump(data, file, indent=4)

print("Weather data saved to data/raw_weather.json")
