# Project_IBBC
Introduction to Bioinformatic and Computational Biology Project 2025/26

****************************************************************************
**			SCRIPTS DA DISCIPLINA => IBBC			   					  **
**																		  **
**			SARA VASQUES ======== FC58163			   					  **
****************************************************************************

ELEMENTS OF THIS ZIP *******************************************************

In this folder, it is possible to find the scripts +  this README.txt +
the Project_ibbc_SaraVasques folder.

If the Project_ibbc_SaraVasques folder exists, to run everything from the
beginning (with the samples given to us by the professor), it is necessary
to put the .faztq.gz raw files from the 01_raw_data folder to the same one
the scripts and the README.txt are in.
After that, delete the project_ibbc_SaraVasques folder that is on the same
folder as the scripts.

REQUIREMENTS TO FUNCTION ***************************************************

1) Having the .fastq.gz files directly in the same folder as the scripts

2) Having **ONLY** the .fastq.gz files and the scripts in the choosen folder

FIRST STEP *****************************************************************

1) Running script1_fc58163.sh in the starting folder (it can be anywhere in
   in the directory of the user).

RESULT) It will create the a folder called Project_ibbc_SaraVasques with 4
	subfolders names 01_raw_data, 02_trimms, 03_logs and 04_results.

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

0) Open the tools_qc environment:
    conda activate tools_qc

1) Running script2_fc58163.sh in the same folder as the other ones.

2) To run, write >>>bash script2_fc58163.sh raw_data_files.txt

RESULT 1) Complete analysis from FastQC, FASTP and MULTIQC

RESULT 2) There is a analysis_fc58163.log file in the 03_logs folder

RESULT 3) The reports in html are stored in the 04_results folder as well as
          the results of the fastqc, fastp and multiqc. However, the trimms
          of the fastp are in the 02_trimms.
