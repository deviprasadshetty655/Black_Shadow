x#!/bin/bash

#created by Black_shadow

# Ask for the path to scan
read -p "Enter the path to scan: " directory

# Check if the directory exists
if [ -d "$directory" ]; then
  # Run the ClamAV scan
  result=$(clamscan -i --remove "$directory" 2>&1)

  # Check if any infections were found
  if [[ $result == *"Infected files: 0"* ]]; then
    echo "No infected files found."
  else
    # Display the scan results
    echo "Infection(s) found:"
    echo "$result"

    # Forcefully remove the infected files
    echo "Removing infected files..."
    clamscan -r -i --remove --force-remove "$directory" 2>&1
  fi
else
  echo "The specified directory does not exist."
fi
