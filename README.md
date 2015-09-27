# GCD_course_project
**Course project for Getting and Cleaning Data course**

This repo explains how all of the scripts work and how they are connected.  

**Code Book**
* CodeBook.md

**Included data files:**

* 1 - merged_UCI_HAR_data.txt

Merged data set that includes, for each activity for each 2.56 recording period, mean and standard deviation for each available measure. Additional columns are included that indicate the subject, activity, and data phase (training or test) of each observation. Detailed information on included variables is provided in the code book document.

* 2 - Summary_step5.txt

A summary data file that includes the mean and standard deviation of each run for each activity for each subject. Separate means are provided for each column in the data set. 

* 2 - varNames_summary.txt

A list of all of the variable names in the file Summary_step5.txt

* 3 - varNames_merge.txt

**Included scripts:**
* run_analysis.R

Includes all of the code used to produce the two data files listed below (items 1 and 2). 

run_analysis.R includes the function mergeFiles, which takes the data directory and data type as arguments and returns a merged data file for a given data type (train, test). More detailed information on the mergeFiles function, as well as other processing done to produce the submitted data files, is included in the document CodeBook.md.
