#!/bin/bash

# Replace YOUR_API_KEY with your actual API key

# Replace YOUR_CITY with the name of your city
CITY=Lausanne

# Set the path to the directory where you want to store the images
IMAGE_DIR=~/Pictures/Wallpapers/weather

# Make the image directory if it doesn't exist
mkdir -p $IMAGE_DIR

# Set the path to the file where we will store the current weather conditions
WEATHER_FILE=$IMAGE_DIR/weather.txt

# Set the path to the file where we will store the current background image
BACKGROUND_FILE=$IMAGE_DIR/default.jpg

# Set the URL for the OpenWeatherMap API
API_URL="https://api.openweathermap.org/data/2.5/weather?q=$CITY&units=metric&appid=$API_KEY"

# Make a request to the API and save the response to a file
curl $API_URL > $WEATHER_FILE

# Extract the weather description from the API response
WEATHER=$(jq -r '.weather[0].main' $WEATHER_FILE)

# Set the background image based on the weather conditions
if [[ $WEATHER = *"Clear"* ]]; then
  # Set the background to a clear sky image
  cp $IMAGE_DIR/clear.jpg $BACKGROUND_FILE
elif [[ $WEATHER = *"Clouds"* ]]; then
  # Set the background to a cloudy sky image
  cp $IMAGE_DIR/clouds.jpg $BACKGROUND_FILE
elif [[ $WEATHER = *"Rain"* ]]; then
  # Set the background to a rainy sky image
  cp $IMAGE_DIR/rain.jpeg $BACKGROUND_FILE
elif [[ $WEATHER = *"Snow"* ]]; then
  # Set the background to a rainy sky image
  cp $IMAGE_DIR/rain.jpeg $BACKGROUND_FILE
elif [[ $WEATHER = *"Drizzle"* ]]; then
  # Set the background to a rainy sky image
  cp $IMAGE_DIR/drizzle.jpeg $BACKGROUND_FILE
elif [[ $WEATHER = *"Thunderstorm"* ]]; then
  # Set the background to a snowy sky image
  cp $IMAGE_DIR/thunderstorm.jpg $BACKGROUND_FILE
else
  # Set the background to a default image
  cp $IMAGE_DIR/default.jpg $BACKGROUND_FILE
fi

# Set the background image
wal -i $BACKGROUND_FILE