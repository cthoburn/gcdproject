## Project for Getting and Cleaning Data (Coursera)  
## Chris Thoburn 05-01-20
## run_analysis.R

## #############################################################
## setup #######################################################
## librarys we need
library("data.table")
library("reshape2")

## remember the directory we start in
startDir <- getwd()

## location where we will store data
dataDir <- "./data"

## name for the data archive we acquire
dataFilename <- "datafile.zip"

## The primary data url
dataURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

## make a directory for the data
if (!file.exists(dataDir)) {dir.create(dataDir)}

## get the file, change the working directory and unzip it
download.file(dataURL, file.path(dataDir, dataFilename))
setwd(dataDir)
unzip(zipfile = dataFilename)

## #############################################################
## primary data subset acquisition 
## #############################################################

## RELEVANT ####################################################
## need a feature list - keep the mean and std ones as relevant
data_features <- fread("UCI HAR Dataset/features.txt",
                       col.names = c("index", "features"))
relevant_features <- grep("(mean|std)\\(\\)", 
                          data_features[, features])

## LABELS ######################################################
## make a list and clean up the formatting
measurements <- gsub('[()]', '', 
                     data_features[relevant_features, features])

## we need a list of all the activities - no clean up needed
data_activities <- fread("UCI HAR Dataset/activity_labels.txt",
                       col.names = c("index", "activities"))

## TRAIN #######################################################
## we need the training data - keep the relevant data
data_train <- fread("UCI HAR Dataset/train/X_train.txt")[, 
                                             relevant_features, 
                                             with = FALSE]

## set the column names
data.table::setnames(data_train, colnames(data_train), measurements)

## add the subject and activity data 
data_train_activities <- fread("UCI HAR Dataset/train/Y_train.txt", 
                               col.names = c("Activity"))
data_train_subjects <- fread("UCI HAR Dataset/train/subject_train.txt", 
                               col.names = c("SubjectNumber"))
data_train <- cbind(data_train_subjects, 
                    data_train_activities, 
                    data_train)

## TEST ########################################################
## we need the test data - keep the relevant data
data_test <- fread("UCI HAR Dataset/test/X_test.txt")[, 
                                                relevant_features, 
                                                with = FALSE]

## set the column names
data.table::setnames(data_test, colnames(data_test), measurements)

## add the subject and activity data 
data_test_activities <- fread("UCI HAR Dataset/test/Y_test.txt", 
                               col.names = c("Activity"))
data_test_subjects <- fread("UCI HAR Dataset/test/subject_test.txt", 
                             col.names = c("SubjectNumber"))
data_test <- cbind(data_test_subjects, 
                   data_test_activities, 
                   data_test)

## #############################################################
## merge the test and train data sets 
## #############################################################
## just an easy row bind will work
data_merge <- rbind(data_train, data_test)

## activity is a number now, we want nice names as factors
data_merge[["Activity"]] <- factor(data_merge[, Activity]
                                 , levels = data_activities[["index"]]
                                 , labels = data_activities[["activities"]])

## SubjectNumber is a number now, we want factors
data_merge[["SubjectNumber"]] <- as.factor(data_merge[, SubjectNumber])

## #############################################################
## we want means by subject number and activity - condense 
## #############################################################
## melt the data table first by what we want to group by
data_merge <- reshape2::melt(data = data_merge, 
                             id = c("SubjectNumber", "Activity"))

## then cast the data table and do the mean calculation on the groups
data_merge <- reshape2::dcast(data = data_merge, 
                              SubjectNumber + Activity ~ variable, 
                              fun.aggregate = mean)

## #############################################################
## Save the final dataset
## #############################################################
## go back to the starting directory
setwd(startDir)

## write the merged data
data.table::fwrite(x = data_merge, 
                   file = "Data_subject_activity.txt",
                   quote = FALSE)


