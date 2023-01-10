#!/bin/bash

# Get the current song from Spotify
song=$(playerctl metadata title)
artist=$(playerctl metadata artist)

# Print the song and artist to stdout
echo "$song - $artist"