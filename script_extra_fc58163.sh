#!/bin/bash

################################################################################
#In this EXTRA SCRIPT, the objective is to move the .fastq.gz files to the     #
#raw_data subfolder of the Project_ibbc_<name>.                                #
################################################################################

# Name to put in the folder
MY_NAME="SaraVasques"

# Where the folder will be created
WORKING_DIR="$(pwd)/Project_ibbc_$MY_NAME"
RAW_DATA_DIR="$WORKING_DIR/01_raw_data"

# If the directory isn't created, create now
mkdir -p "$RAW_DATA_DIR"

echo "Moving the .fastq.gz files to $RAW_DATA_DIR..."

# Verify if there are .fastq.gz archives in the directory the user is on
shopt -s nullglob
FASTQ_FILES=(*.fastq.gz)

if [ ${#FASTQ_FILES[@]} -eq 0 ]; then
  echo "There aren't .fastq.gz files in this directory."
  exit 0
fi

# Moving the files now that we know they exist
for FILE in "${FASTQ_FILES[@]}"; do
  mv "$FILE" "$RAW_DATA_DIR/"
  echo "'$FILE' file was moved to '$RAW_DATA_DIR'."
done

echo "All files moved!" 

