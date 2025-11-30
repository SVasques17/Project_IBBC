#!/bin/bash

################################################################################
# In this SCRIPT2 , the FASTQC, FASTP and MULTIQC analyses are done and every  #
# output gets put on different folders:                                        #
# results_fastqc, results_fastp and results_multiqc.                           #
################################################################################

# Name to put in the folder
MY_NAME="SaraVasques"

# Defining some directories
WORKING_DIR="$(pwd)/Project_ibbc_$MY_NAME"

RAW_DATA_DIR="$WORKING_DIR/01_raw_data"
TRIMMS_DIR="$WORKING_DIR/02_trimms"
LOGS_DIR="$WORKING_DIR/03_logs"
RESULTS_DIR="$WORKING_DIR/04_results"
RESULTS_FASTQC="$RESULTS_DIR/results_fastqc"
RESULTS_FASTP="$RESULTS_DIR/results_fastp"
RESULTS_MULTIQC="$RESULTS_DIR/results_multiqc"
LOGS="$LOGS_DIR/analysis_fc58163.log"

mkdir -p "$RAW_DATA_DIR" "$TRIMMS_DIR" "$LOGS_DIR"
mkdir -p "$RESULTS_FASTQC" "$RESULTS_FASTP" "$RESULTS_MULTIQC"

echo "NEW RUN -----------------------------------" >> "$LOGS"
echo "VERIFYING THE INPUT FILE..." >> "$LOGS"
echo " " >> "$LOGS"

# Check if there is the input file
if [ -z "$1" ]; then
    echo "No sample list inputted! Try: script2_fc58163.sh raw_data_files.txt"
    exit 1
fi

SAMPLE_LIST="$WORKING_DIR/$1"

# Check if the input file exists
if [ ! -f "$SAMPLE_LIST" ]; then
    echo "No file with the name '$SAMPLE_LIST' found!"
    exit 1
fi

echo "INPUT FILE RECEIVED!" >> "$LOGS"
echo "STARTING WITH THE ANALYSIS -- WEEK 2 -- $(date) -- FC58163" >> "$LOGS"
echo " " >> "$LOGS"

#######################################################################
################GROUP FILES INTO PAIRS
#######################################################################

echo "READING THE FILE AND PAIRING THE SAMPLES..." >> "$LOGS"
echo " " >> "$LOGS"

exec 3< "$SAMPLE_LIST"

while true; do
  
  # Reading the first file of the pair
  read -r FF <&3
  [ -z "$FF" ] && break
  
  # Reading the second file of the pair
  read -r BF <&3
  if [ -z "$BF" ]; then
    echo "Error: Unpaired file => $FF"
    continue
  fi
  
  # Sample pair
  FORWARD_FILE="$RAW_DATA_DIR/$FF"
  BACKWARDS_FILE="$RAW_DATA_DIR/$BF"
  
  # Verifying if files exist
  if [ ! -f "$FORWARD_FILE" ]; then
      echo "Error: '$FORWARD_FILE' not found!"
      continue
  fi
  
  if [ ! -f "$BACKWARDS_FILE" ]; then
      echo "Error: '$BACKWARDS_FILE' not found!"
      continue
  fi
  
  
  PAIRED_SAMPLE_NAME=$(basename "$FF" | sed 's/_1_.*//')
  
  echo "$PAIRED_SAMPLE_NAME PAIR FOUND!" >> "$LOGS"
  echo " " >> "$LOGS"
  
  #######################################################################
  ################ FIRST FASTQC
  #######################################################################

  echo "1) FIRST FASTQC ANALYSIS------------------------------------" >> "$LOGS"
  echo " " >> "$LOGS"
  
  fastqc "$FORWARD_FILE" "$BACKWARDS_FILE" -o "$RESULTS_FASTQC" 2>> "$LOGS"
  
  #######################################################################
  ################ FASTP
  #######################################################################
  
  echo " " >> "$LOGS"
  echo "2) FASTP ANALYSIS------------------------------------------" >> "$LOGS"
  echo " " >> "$LOGS"
  
  fastp \
      -i "$FORWARD_FILE" -I "$BACKWARDS_FILE" \
      -o "$TRIMMS_DIR/${PAIRED_SAMPLE_NAME}_p_1.fastq.gz" \
      -O "$TRIMMS_DIR/${PAIRED_SAMPLE_NAME}_p_2.fastq.gz" \
      --html "$RESULTS_FASTP/${PAIRED_SAMPLE_NAME}.html" \
      --json "$RESULTS_FASTP/${PAIRED_SAMPLE_NAME}.json" \
      --detect_adapter_for_pe \
      --trim_front1 12 \
      --trim_front2 12 \
      >> "$LOGS" 2>&1
  
  echo " " >> "$LOGS"
  
  # Naming the new files to be analysed again to the second fastqc   
  PAIR_FORWARD="$TRIMMS_DIR/${PAIRED_SAMPLE_NAME}_p_1.fastq.gz"
  PAIR_BACKWARDS="$TRIMMS_DIR/${PAIRED_SAMPLE_NAME}_p_2.fastq.gz"
  
  #######################################################################
  ################ SECOND FASTQC
  #######################################################################

  fastqc "$PAIR_FORWARD" "$PAIR_BACKWARDS" -o "$RESULTS_FASTQC" 2>> "$LOGS"

done  
#######################################################################
################ MULTIQC
#######################################################################

echo " " >> "$LOGS"
echo "3) MULTIQC ANALYSIS------------------------------------------" >> "$LOGS"
echo " " >> "$LOGS"
  
multiqc "$RESULTS_DIR" -o "$RESULTS_MULTIQC" 2>> "$LOGS"
  
echo " " >> "$LOGS"
echo "ANALYSIS FINISHED!! -- $(date)" >> "$LOGS"
echo " " >> "$LOGS"
echo "LOG FILE FINALIZED!!" >> "$LOGS"
echo " " >> "$LOGS"
echo "Analysis Finalized!!"
  
  