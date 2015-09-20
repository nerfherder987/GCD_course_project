## Getting and Cleaning Data: Course project
# set working directory
setwd("/home/ainsley/Documents/Data_Science_Coursera/Getting_and_Cleaning_Data/GCD_course_project")

# list files in the training data and save list as variable
trainData <- list.files(paste(getwd(),"/UCI HAR Dataset/train",sep=""))

# list files in the test data and save list as variable
testData <- list.files(paste(getwd(),"/UCI HAR Dataset/test",sep=""))

# List other files in directory and save list as variable
otherFiles <- list.files(paste(getwd(),"/UCI HAR Dataset",sep=""))

# Load features  

# 1. Merge the training and the test sets to create one data set.
## 

# 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
# 3. Uses descriptive activity names to name the activities in the data set
# 4. Appropriately labels the data set with descriptive variable names. 
# 5. From the data set in step 4, creates a second, independent tidy data set with the average of 
#    each variable for each activity and each subject.