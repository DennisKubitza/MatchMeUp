 
#!/bin/bash

# Directory containing the CSV files
DIRECTORY="./Auspendler"

# Loop through all CSV files in the directory
for file in "$DIRECTORY"/*.csv
do
  # Check if the file exists
  if [[ -f "$file" ]]; then
    # Use sed to replace all dots with empty strings
    sed -i 's/\.//g' "$file"
    echo "Processed $file"
  else
    echo "No CSV files found in the directory."
  fi
done

DIRECTORY="./Einpendler"

# Loop through all CSV files in the directory
for file in "$DIRECTORY"/*.csv
do
  # Check if the file exists
  if [[ -f "$file" ]]; then
    # Use sed to replace all dots with empty strings
    sed -i 's/\.//g' "$file"
    echo "Processed $file"
  else
    echo "No CSV files found in the directory."
  fi
done
