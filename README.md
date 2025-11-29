# Project_IBBC
Introduction to Bioinformatic and Computational Biology Project 2025/26

****************************************************************************
**			SCRIPTS DA DISCIPLINA => IBBC			   					  **
**																		  **
**			SARA VASQUES ======== FC58163			   					  **
****************************************************************************

REQUIREMENTS TO FUNCTION ***************************************************

1) Having the .fastq.gz files directly in the same folder as the scripts

2) Having **ONLY** the .fastq.gz files and the scripts in the choose folder

FIRST STEP *****************************************************************

1) Running script1_fc58163.sh in the starting folder (in can be anyware in
   in the directory of the user).

RESULT) It will create the a folder called Project_ibbc_SaraVasques with 5
	subfolders names 01_raw_data, 02_fastqc, 03_trimms, 04_logs and 
	05_results.

SECOND STEP ****************************************************************

1) Running script_extra_fc58163.sh in the same starting folder as 
   scrip1_fc58163.sh

RESULT) The .fastq.gz files will be moved from the starting folder to the
	01_raw_data folder.

THIRD STEP *****************************************************************

1) Running script_extra2_fc58163.sh in the same folder as the other scripts.

RESULT) Inside Project_ibbc_<name>, a file named "raw_data_Files.txt" is
	going to be created. It contains the names of the .fastq.gz files.

FOURTH STEP ****************************************************************

1) Running script2_fc58163.sh in the same folder as the other ones.

2) To run, write script2_fc58163.sh raw_data_files.txt

RESULT 1) Complete analysis from FastQC, FASTP and MULTIQC

RESULT 2) There is a analysis_fc58163.log file in the 04_logs folder

RESULT 3) The reports in html are stored in the 05_results folder
