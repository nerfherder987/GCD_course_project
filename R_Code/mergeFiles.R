## Getting and Cleaning Data: Course project
############################################

# set working directory
setwd("/home/ainsley/Documents/Data_Science_Coursera/Getting_and_Cleaning_Data/GCD_course_project")

############ Get data info ###############
# Directory where training data is stored
trainDir <- "/home/ainsley/Documents/Data_Science_Coursera/Getting_and_Cleaning_Data/GCD_course_project/UCI HAR Dataset/train/Inertial Signals"
# Directory where test data is stored
testDir <- "/home/ainsley/Documents/Data_Science_Coursera/Getting_and_Cleaning_Data/GCD_course_project/UCI HAR Dataset/test/Inertial Signals"

# list files in the training data and save list as variable
trainData <- list.files(paste(getwd(),"/UCI HAR Dataset/train/Inertial Signals",sep=""))

# list files in the test data and save list as variable
testData <- list.files(paste(getwd(),"/UCI HAR Dataset/test/Inertial Signals",sep=""))

# List other files in UCI HAR Dataset directory and save list as variable
otherFiles <- list.files(paste(getwd(),"/UCI HAR Dataset",sep=""))

# Load features and activity labels as a data frame
features <- read.table("UCI HAR Dataset/features.txt",header=F,stringsAsFactors=F)
names(features) <- c("rowNum","feature") # set variable names
act.labels <- read.table("UCI HAR Dataset/activity_labels.txt",header=F,stringsAsFactors=F)
names(act.labels) <- c("rowNum","activity") # set variable names

## get column names for training and test data sets
trainVars <- sub(".txt","",trainData)
testVars <- sub(".txt","",testData)

# list of file locations
testFiles <- paste(testDir,"/",testData,sep="")

##################################################################
# 1. Merge the training and the test sets to create one data set.#
##################################################################
#    Merge Function:
#    The only argument for the mergeFiles function is the data directory
#    Reads each file and merges the columns into a single data frame (returns df)
#    Assumes all files have the same number of cases.
mergeFiles <- function(directory) {
  # Get a list of all the files in the directory specified
  fileList <- list.files(directory,pattern=".txt")
  # Adds the specified directory to each file name in fileList
  # so that each element in allFiles is the complete path to a data file
  # Did this because I didn't want to have to change the working directory in the function
  allFiles <- paste(directory,"/",fileList,sep="")
  # Null object to hold merged data
  merged <- NULL
  # Create variable names for merged file from file list
  varNames <- sub(".txt","",fileList)
  # Read in each file and merge 
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

# Create two merged files: One for training data and one for test data
mergeTrain <- mergeFiles(trainDir)
mergeTest <- mergeFiles(testDir)