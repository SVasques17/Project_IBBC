#!/bin/bash

################################################################################
#In this EXTRA SCRIPT, the objective is to copy the name of the .fastq.gz files#
#to a txt file inside the Project_ibbc_<name>.                                 #
#FC58163                                                                       #
################################################################################

# Name to put in the folder
MY_NAME="SaraVasques"

# Where the folder will be created
WORKING_DIR="$(pwd)/Project_ibbc_$MY_NAME"
RAW_DATA_DIR="$WORKING_DIR/01_raw_data"

#Name of the txt file
OUTPUT_FILE="raw_data_files.txt"

#Verifies if a certain directory exists
if [ ! -d "$RAW_DATA_DIR" ]; then
  echo "'$RAW_DATA_DIR' folder was not found!"
  exit 1
fi

# Writes on the txt file the names of the .fastq.gz files
find "$RAW_DATA_DIR" -type f -name "*.fastq.gz" -printf "%f\n" | sort -V > "$WORKING_DIR/$OUTPUT_FILE"

echo "List of the .fastq.gz files created in '$OUTPUT_FILE'!"

