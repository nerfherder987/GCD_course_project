# Data Science: Getting and Cleaning Data 
## Course Project

**Project Instructions:** [Getting and Cleaning Data: Course Project] (https://class.coursera.org/getdata-032/human_grading/view/courses/975116/assessments/3/submissions)

Instructions: a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md

###### Description of Data Processing

The file run_analysis.R includes all code used to produce the submitted data files. The mergeFiles function, included in the script file, creates merged data files for each data type (training,test). All directory paths used in the script are described relative to the user's current working directory, with the data directory (UCI HAR Dataset) within the user's current working directory. For additional detail on the UCI HAR Dataset, please see the documentation included with that dataset: [Download UCI HAR Dataset] (https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) 

The mergeFiles function reads the following data files from the UCI HAR Dataset directory:

* **features.txt:** Feature list

* **train/X_train.txt**: Training set data

* **train/y_train.txt:** Training labels

* **test/X_test.txt:** Test set data

* **test/y_test.txt:** Test labels

* **train/subject_train.txt:** Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30 (n = 21 unique subjects)

* **test/subject_test.txt:** Each row identifies the subject who performed the activity for each window sample. Its range is from 2 to 24. (n = 9 unique subjects)
**NOTE:** There is no overlap between subjects providing training and those providing test data. 

The script first reads in the text files that store the activity labels (activity_labels.txt) and feature list (features.txt - I realize it's wasteful resource-wise to read those each time the function is called. Ooops!). Next, depending on the data type specified (training, test), the function reads the labels (y_train.txt, y_test.txt), subject (subject_train.txt, subject_test.txt), and data sets(X_train.txt, X_test.txt). The column names for the feature columns in the training/test data sets are taken from the names in the file features.txt. After column names are added, the column names are searched, and only those feature columns with either "mean" or "std" in the variable name are retained in the data set. Next, the three data sources are merged using the cbind function. The activity_labels.txt file is then merged with the combined data set so that the numeric code for each activity has a text label associated with it. A new variable, "data_type", is added to indicate whether the current file is training or test data, and the column order is modified so that the identifier variables are listed first (subject, data_type, activity, activity_label).

Further processing of the data files is done outside of the mergeFiles function. Merged test and training data files are created, then these files are merged into a single data set using the rbind function. After the messy column names are neatened (remove () and dashes, replace with underscore), the merged data file is grouped by (using dplyr group_by) data type, activity label, and subject. A summary file is created using the summarize_each function (also from the dplyr package). Finally, merged (merged_UCI_HAR_data.txt) and summary (Summary_step5.txt) text data files are saved to the current working directory.


**Variables included in processed data sets**

subject - Subject identifier (numeric; range 1 - 30)

activity - Numeric activity label (range 1 - 6)

activity_label - Text activity label (e.g. WALKING, STANDING)

data_type - Data collection phase (training, test)

**Feature Variables**

The following feature variables are included in the data sets created by run_analysis.R. For more information on the contents of each variable, please see the documentation provided with the source dataset: [Link to UCI HAR Dataset feature_info.txt] (https://github.com/nerfherder987/GCD_course_project/blob/master/UCI%20HAR%20Dataset/features_info.txt) 

**Note: ** The column names in the merged file (merged_UCI_HAR_data.txt) are summary statistics (mean or standard deviation, as indicated in the variable name) for each feature, but the variables in the summary data file (Summary_step5.txt) are means of the variables in summary file.

**tBodyAcc**

* tBodyAcc_mean_X
* tBodyAcc_mean_Y
* tBodyAcc_mean_Z
* tBodyAcc_std_X
* tBodyAcc_std_Y
* tBodyAcc_std_Z

**tGravityAcc**

* tGravityAcc_mean_X
* tGravityAcc_mean_Y
* tGravityAcc_mean_Z
* tGravityAcc_std_X
* tGravityAcc_std_Y
* tGravityAcc_std_Z

**tBodyAccJerk**

* tBodyAccJerk_mean_X
* tBodyAccJerk_mean_Y
* tBodyAccJerk_mean_Z
* tBodyAccJerk_std_X
* tBodyAccJerk_std_Y
* tBodyAccJerk_std_Z

**tBodyGyro**

* tBodyGyro_mean_X
* tBodyGyro_mean_Y
* tBodyGyro_mean_Z
* tBodyGyro_std_X
* tBodyGyro_std_Y
* tBodyGyro_std_Z

**tBodyGyroJerk**

* tBodyGyroJerk_mean_X
* tBodyGyroJerk_mean_Y
* tBodyGyroJerk_mean_Z
* tBodyGyroJerk_std_X
* tBodyGyroJerk_std_Y
* tBodyGyroJerk_std_Z

**tBodyAccMag**

* tBodyAccMag_mean
* tBodyAccMag_std

**tGravityAccMag**

* tGravityAccMag_mean
* tGravityAccMag_std

**tBodyAccJerkMag**

* tBodyAccJerkMag_mean
* tBodyAccJerkMag_std

**tBodyGyroMag**

* tBodyGyroMag_mean
* tBodyGyroMag_std

**tBodyGyroJerkMag**

* tBodyGyroJerkMag_mean
* tBodyGyroJerkMag_std

**fBodyAcc**

* fBodyAcc_mean_X
* fBodyAcc_mean_Y
* fBodyAcc_mean_Z
* fBodyAcc_std_X
* fBodyAcc_std_Y
* fBodyAcc_std_Z
* fBodyAcc_meanFreq_X
* fBodyAcc_meanFreq_Y
* fBodyAcc_meanFreq_Z

**fBodyAccJerk**

* fBodyAccJerk_mean_X
* fBodyAccJerk_mean_Y
* fBodyAccJerk_mean_Z
* fBodyAccJerk_std_X
* fBodyAccJerk_std_Y
* fBodyAccJerk_std_Z
* fBodyAccJerk_meanFreq_X
* fBodyAccJerk_meanFreq_Y
* fBodyAccJerk_meanFreq_Z

**fBodyGyro**

* fBodyGyro_mean_X
* fBodyGyro_mean_Y
* fBodyGyro_mean_Z
* fBodyGyro_std_X
* fBodyGyro_std_Y
* fBodyGyro_std_Z
* fBodyGyro_meanFreq_X
* fBodyGyro_meanFreq_Y
* fBodyGyro_meanFreq_Z

**fBodyAccMag**

* fBodyAccMag_mean
* fBodyAccMag_std
* fBodyAccMag_meanFreq

**fBodyAccJerkMag**

* fBodyBodyAccJerkMag_mean
* fBodyBodyAccJerkMag_std
* fBodyBodyAccJerkMag_meanFreq

**fBodyBodyGyroMag**

* fBodyBodyGyroMag_mean
* fBodyBodyGyroMag_std
* fBodyBodyGyroMag_meanFreq

**fBodyBodyGyroJerkMag**

* fBodyBodyGyroJerkMag_mean
* fBodyBodyGyroJerkMag_std
* fBodyBodyGyroJerkMag_meanFreq

**angle**

* angle(tBodyAccMean,gravity)
* angle(tBodyAccJerkMean),gravityMean)
* angle(tBodyGyroMean,gravityMean)
* angle(tBodyGyroJerkMean,gravityMean)
* angle(X,gravityMean)
* angle(Y,gravityMean)
* angle(Z,gravityMean)
