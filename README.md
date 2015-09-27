# GCD_course_project
**Course project for Getting and Cleaning Data course**

This document provides an overview of the scripts, data files, and documents included in the GitHub repository: nerfherder987/GCD_course_project.

All data files posted here are based upon files provided in the Human Activity Recognition Using Smartphones Dataset (v1.0):
**UCI HAR Dataset:** [Download source data] (https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) 

For more information on the UCI HAR Dataset:
==================================================================
Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Università degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws
==================================================================

## Repository Contents

** Code Book **

* CodeBook.md

Describes data file contents and data processing steps that produced the included files.

**Included data files:**

* 1 - merged_UCI_HAR_data.txt

Merged data set that includes, for each activity for each 2.56 recording period, mean and standard deviation for each available measure. Additional columns are included that indicate the subject, activity, and data phase (training or test) of each observation. The data set consists of 10,299 rows (different number of rows for each participant). Each row corresponds to a single recording period. Detailed information on each variable included in the file is provided in the code book document.

* 2 - Summary_step5.txt

A summary data file that includes the average of each measure/variable for each activity for each subject. The data file consists of 180 rows, 6 rows for each subject (1 for each of the 6 activities) for each of the 30 participants who provided training and test data. The column names are identical to those in the file merged_UCI_HAR_data.txt, however, the value for each case in this summary file is the mean of all observations (by subject and activity) from the merged dataset. In other words, the columns that are means are really means of means, and the standard deviation columns are mean standard deviations.

* 2 - varNames_summary.txt

A list of all of the variable names in the file Summary_step5.txt

* 3 - varNames_merge.txt

**Included scripts:**
* run_analysis.R

An R script file that includes all of the code used to produce the two data files listed above (items 1 and 2). 

run_analysis.R includes the function mergeFiles, which takes the data directory and data type as arguments and returns a merged data file for a given data type (train, test). Further processing of the data files, including merging the the training and test data and cleaning up column names, is also included in run_analysis.R, but the remaining processing is not part of the mergeFiles function. More detailed information on the mergeFiles function, as well as other processing done to produce the submitted data files, is included in the document CodeBook.md.
