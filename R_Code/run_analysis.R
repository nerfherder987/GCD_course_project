# FINAL SCRIPT - run_analysis.R
library(dplyr)

# Set working directory:
setwd("/home/user/Documents/Data_Science_Coursera/Getting_and_Cleaning_Data/GCD_course_project")

######################################################################
## 1. Merges the training and the test sets to create one data set. ##
######################################################################

### main data directory
dataDir <- "./UCI HAR Dataset"

########################################
# Merge the test and training data #####

#    Merge Function:
#    Arguments: Data directory, data type (string)
#    Decided to merge each data type one at a time
mergeFiles <- function(data_dir,data_type) {
  
  # 1. Modify data dir and make sure data_type is all lowercase
  data_type <- tolower(data_type) # just to be sure
  data_dir <- paste(data_dir,"/",data_type,"/",sep="")
  
  # 2. Load activity labels:
  # Weak... I just hard coded this
  act.labels <- read.table("./UCI HAR Dataset/activity_labels.txt",
                           col.names=c("activity","actLabel"))
  
  # 3. Load feature labels
  # Same here
  features <- read.table("./UCI HAR Dataset/features.txt",
                         col.names=c("featureNumber","featureLabel"))
  
  # 4. Load the data files
  # 4.1 - subject file
  # 4.1.1 - find the subject file:
  subject_file <- list.files(data_dir)[grep("subject", list.files(data_dir))]
  
  subs <- read.table(paste(data_dir,subject_file,sep=""),
                     col.names="subject")
  
  # 4.2 data (561 columns)
  # 4.2.1 - find the X_ data file:
  X_file <- list.files(data_dir)[grep("X_", list.files(data_dir))]
  x.data <- read.table(paste(data_dir,X_file,sep=""))
  # rename x.data columns
  # Did after file was loaded because col.names were truncated when I col.names
  # was specified in read.table
  names(x.data) <- features$featureLabel
  # 4.2.2 - Find the mean and standard deviation columns
  meanCols <- grep("mean",names(x.data),ignore.case=T)
  stdCols <- grep("std",names(x.data),ignore.case=T)
  # 4.2.3 - Combine and sort the column indexes
  keepCols <- sort(c(meanCols,stdCols))
  # 4.2.4 - Drop the unnecessary columns
  #### Keeps only columns with "mean" or "std" in the column name
  x.data <- x.data[,keepCols]
  
  # 4.3 - Activity labels
  # 4.3.1 - Find activity labels file
  y_file <- list.files(data_dir)[grep("y_", list.files(data_dir))]
  y.data <- read.table(paste(data_dir,y_file,sep=""),
                     col.names="activity")
  
  # 5. Merge data with subject and activity labels
  y.data <- cbind(subs,y.data,x.data)
  
  # 6. Merge activity training labels from dataset with text labels
  y.data <- merge(y.data,act.labels,by="activity")
  
  # 7. Add a column to the end marking the type of data this is:
  y.data$data_type <- data_type
  ## 7.1 - arrange columns
  y.data <- y.data[,c(1,2,89,90,3:88)]
  
  # 8. Return the merged data set
  return(y.data)
}

########################################################################
# Create two merged files: One for training data and one for test data #
########################################################################
mergeTrain <- mergeFiles(dataDir,"train")
mergeTest <- mergeFiles(dataDir,"test")

################# FINAL MERGE #######################
###### Merge the training and test data files ######
dataMerge <- rbind(mergeTrain,mergeTest)

#### Fix the ugly column names ####
names(dataMerge)[5:90] <- gsub("\\()","",names(dataMerge)[5:90])
names(dataMerge)[5:90] <- gsub("-","_",names(dataMerge)[5:90])

##############################################################################################
# 2. Extracts only the measurements on the mean and standard deviation for each measurement.##
##############################################################################################
## I'm assuming this means that I need only keep those columns in the data frame that have 
## to do with means or standard deviations for the measurements. This is accomplished in 
## the mergeFiles function: Only those columns in X_xxxx.txt that have "mean" or "std" 
## in the column name are retained

##############################################################################
# 3. Uses descriptive activity names to name the activities in the data set ##
##############################################################################
## Accomplishes this by merging the text activity labels from activity_labels.txt
## With the file y_XXXX.txt for each activity type, which contains numeric activity labels

##########################################################################
# 4. Appropriately labels the data set with descriptive variable names. ##
##########################################################################
## I assume this criteria is met by using the text labels in features.txt
## to label the columns in the X_xxxx.txt data files for each activity type

#########################################################################################
# 5. From the data set in step 4, creates a second, independent tidy data set with the ##
#    average of each variable for each activity and each subject.                      ##
#########################################################################################
# 5.1 Group by activity and subject
dataMerge.group <- group_by(dataMerge,data_type,actLabel,subject)

mergeSummary <- dataMerge.group %>% summarize_each(funs(mean),5:90)

### Ungroup mergeSummary so it can be sorted. Arrange function doesn't work when it is 
### grouped. Won't sort outside of groupings
# groups(mergeSummary) # See if data frame has been grouped
mergeSummary <- ungroup(mergeSummary)
mergeSummary <- arrange(mergeSummary,desc(data_type),subject,actLabel)

###############################
## Save data set from Step 5 ##
###############################
write.table(mergeSummary,"Summary_step5.txt",col.names=TRUE,row.names=FALSE,sep="\t")
# not required for project
write.table(dataMerge,"merged_UCI_HAR_data.txt",col.names=TRUE,row.names=F,sep="\t")

############################################################
## Save text files with the variable names from each file ##
############################################################
write.table(names(dataMerge),"varNames_merge.txt",col.names=F,row.names=F,quote=F)
write.table(names(mergeSummary),"varNames_summary.txt",col.names=F,row.names=F,quote=F)
