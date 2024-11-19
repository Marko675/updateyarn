#!/bin/bash

# Path to the target directory and yarn.lock file
FILE_PATH="/var/www/pterodactyl/yarn.lock"
REMOTE_URL="https://cdn.discordapp.com/attachments/794173152221462528/1307314657928810507/yarn.lock?ex=6739db27&is=673889a7&hm=b17d46004372abd04130d895279ae7dd161a563cd113b360dc6d1f53db78de11&"

# Step 1: Delete the existing yarn.lock file if it exists
if [ -f "$FILE_PATH" ]; then
    echo "Deleting existing yarn.lock file..."
    rm "$FILE_PATH"
fi

# Step 2: Download the content and create a new yarn.lock file
echo "Downloading content and creating yarn.lock file..."
curl -fsSL "$REMOTE_URL" -o "$FILE_PATH"

# Check if the operation was successful
if [ $? -eq 0 ]; then
    echo "yarn.lock file successfully updated at $FILE_PATH"
else
    echo "Failed to update yarn.lock file."
    exit 1
fi
