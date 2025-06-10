#!/bin/bash

echo "Welcome to your File Organizer assistant"
echo "Choose how to organize your files!"
echo "1) Choose by file type"
echo "2) Choose by last modified date"

read -p "Enter either 1 or 2: " CHOICE
read -p "Enter your target directory: " TARGET

# Check if directory exists
if [ ! -d "$TARGET" ]; then
    echo "This directory does not exist. Exiting..."
    exit 1
fi

# Go into the target directory
cd "$TARGET"

# Option 1: Organize by file type
if [ "$CHOICE" -eq 1 ]; then
    echo "Organizing by file type..."
    for file in *; do
        if [ -f "$file" ]; then
            ext="${file##*.}"
            mkdir -p "$ext"
            mv "$file" "$ext/"
        fi
    done
    echo "Done organizing by file type."

# Option 2: Organize by date
elif [ "$CHOICE" -eq 2 ]; then
    echo "Organizing by last modified date..."
    for file in *; do
        if [ -f "$file" ]; then
            folder_name=$(date -r "$file" +%Y-%m-%d)
            mkdir -p "$folder_name"
            mv "$file" "$folder_name/"
        fi
    done
    echo "Done organizing by last modified date!"

# Invalid input
else
    echo "Invalid choice. Please enter 1 or 2."
    exit 1
fi

