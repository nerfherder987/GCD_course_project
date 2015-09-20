## Getting and Cleaning Data: Course project
# set working directory
setwd("/home/ainsley/Documents/Data_Science_Coursera/Getting_and_Cleaning_Data/GCD_course_project")
trainDir <- "/home/ainsley/Documents/Data_Science_Coursera/Getting_and_Cleaning_Data/GCD_course_project/UCI HAR Dataset/train/Inertial Signals"
testDir <- "/home/ainsley/Documents/Data_Science_Coursera/Getting_and_Cleaning_Data/GCD_course_project/UCI HAR Dataset/test/Inertial Signals"

# list files in the training data and save list as variable
trainData <- list.files(paste(getwd(),"/UCI HAR Dataset/train/Inertial Signals",sep=""))

# list files in the test data and save list as variable
testData <- list.files(paste(getwd(),"/UCI HAR Dataset/test/Inertial Signals",sep=""))

# List other files in directory and save list as variable
otherFiles <- list.files(paste(getwd(),"/UCI HAR Dataset",sep=""))

# Load features and activity labels
features <- read.table("UCI HAR Dataset/features.txt",header=F,stringsAsFactors=F)
names(features) <- c("rowNum","feature")

act.labels <- read.table("UCI HAR Dataset/activity_labels.txt",header=F,stringsAsFactors=F)
names(act.labels) <- c("rowNum","activity")

# 1. Merge the training and the test sets to create one data set.
## get column names for training and test data sets
trainVars <- sub(".txt","",trainData)
testVars <- sub(".txt","",testData)

# list of file locations
testFiles <- paste(testDir,"/",testData,sep="")

# arguments are data directory and list of file names
mergeFiles <- function(directory, fileList) {
  # Adds the specified directory to each file name in fileList
  # so that each element in allFiles is the complete path to a data file
  allFiles <- paste(directory,"/",fileList,sep="")
  # object to hold merged data
  merged <- NULL
  # Create variable names for merged file from file list
  varNames <- sub(".txt","",fileList)
  for (i in 1:length(allFiles)){
    # Couldn't get this to read the file in as just one column
    #current.file <- read.table(allFiles[[i]],header=FALSE,sep=" ")
    # Reads in the data as a single list object, long string of numbers
    current.file <- scan(allFiles[[i]])
    # append the data in current.file to the object "merged"
    merged <- cbind(merged,current.file)
  }
  # convert "merged" to a data frame
  merged <- data.frame(merged)
  # Assigns varNames as variable names in 'merged'
  names(merged) <- varNames
  # returns the merged data set
  return(merged)
}


# 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
# 3. Uses descriptive activity names to name the activities in the data set
# 4. Appropriately labels the data set with descriptive variable names. 
# 5. From the data set in step 4, creates a second, independent tidy data set with the average of 
#    each variable for each activity and each subject.