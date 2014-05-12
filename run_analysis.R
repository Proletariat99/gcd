# run_analysis.R
# This script does the following:
#  - Merges the training and the test sets to create one data set.
#  - Extracts only the measurements on the mean and standard deviation for each measurement. 
#  - Uses descriptive activity names to name the activities in the data set
#  - Appropriately labels the data set with descriptive activity names. 
#  - Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

# Getting the data:
data_folder <- "./data"
test_folder <- "data/UCI HAR Dataset/test"
train_folder <- "data/UCI HAR Dataset/train"
test_files <- list.files(path=test_folder, recursive=TRUE, full.names=TRUE)
train_files <- list.files(path=train_folder, recursive=TRUE, include.dirs=TRUE)

for(file in test_files){
  
}

# test_data <- lapply(test_files, read.delim)
# train_data <- lapply(test_files, read.delim2, sep="\t")