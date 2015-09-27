# GCD_course_project
**Course project for Getting and Cleaning Data course**

This document provides an overview of the scripts, data files, and documents included in the GitHub repository: GCD_course_project.

**Code Book**
* CodeBook.md

**Included data files:**

* 1 - merged_UCI_HAR_data.txt

Merged data set that includes, for each activity for each 2.56 recording period, mean and standard deviation for each available measure. Additional columns are included that indicate the subject, activity, and data phase (training or test) of each observation. The data set consists of 10,299 rows (different number of rows for each participant). Each row corresponds to a single recording period. Detailed information on each variable included in the file is provided in the code book document.

* 2 - Summary_step5.txt

A summary data file that includes the mean and standard deviation of each measure/variable for each activity for each subject. The data file consists of 180 rows, 6 rows for each activity for each of the 30 participants who provided training and test data. Separate means are provided for each column in the data set. 

* 2 - varNames_summary.txt

A list of all of the variable names in the file Summary_step5.txt

* 3 - varNames_merge.txt

**Included scripts:**
* run_analysis.R

Includes all of the code used to produce the two data files listed above (items 1 and 2). 

run_analysis.R includes the function mergeFiles, which takes the data directory and data type as arguments and returns a merged data file for a given data type (train, test). Further processing of the data files, including merging the the training and test data and cleaning up column names, is also included in run_analysis.R, but the remaining processing is not part of the mergeFiles function. More detailed information on the mergeFiles function, as well as other processing done to produce the submitted data files, is included in the document CodeBook.md.
