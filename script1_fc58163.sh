#!/bin/bash

################################################################################
#In this FIRST SCRIPT, the objective is to create the folder structure that we #
#are going to use throughout the analysis.                                     #
################################################################################

# Name to put in the folder
MY_NAME="SaraVasques"

# Where the folder will be created
WORKING_DIR="$(pwd)/Project_ibbc_$MY_NAME"
SUBFOLDERS=("01_raw_data" "02_trimms" "03_logs" "04_results")

echo "Project directory being created..."

# Creating the main directory/folder
mkdir -p "$WORKING_DIR"

echo "Project directory created at: $WORKING_DIR"
echo "Project subfolders being created..."

for folder in "${SUBFOLDERS[@]}"; do
    mkdir -p "$WORKING_DIR/$folder"
done

echo "Project subfolders created!"