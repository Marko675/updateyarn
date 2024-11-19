#!/bin/bash

FILE_PATH="/var/www/pterodactyl/yarn.lock"
REMOTE_URL="https://drive.google.com/uc?export=download&id=1Eb3WiE1NNfFiKBib26EQM3Ssyt81KB9a"

echo "Deleting existing yarn.lock file if it exists..."
rm -f "$FILE_PATH"

echo "Downloading yarn.lock file from Google Drive..."
curl -fsSL "$REMOTE_URL" -o "$FILE_PATH"

if [ $? -ne 0 ]; then
    echo "Error: Failed to download yarn.lock file."
    exit 1
fi

echo "Verifying file..."
if [ -s "$FILE_PATH" ]; then
    echo "yarn.lock file successfully updated at $FILE_PATH"
else
    echo "Error: The downloaded file is empty or invalid."
    exit 1
fi
