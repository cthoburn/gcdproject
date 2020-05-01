Project for Getting and Cleaning Data (Coursera)
Chris Thoburn 05-01-20
CodeBook.md

Data sources:
*********************************************************************
This is the site the original data was obtained: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

This is the source of the data for this project:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip


Primary data:
*********************************************************************
The original (primary) data will be downloaded by the run_analysis.R script and stored in the ,/data directory under the UCI_HAR_Dataset directory.  This dataset comes with detailed parameter decriptions.  The primary data will not be altered.


Secondary data:
*********************************************************************
The run_analysis.R script will generate the Data_measurements dataset by merging the test and training primary datasets and extracting the measurement means and standard deviations.  The Data_subject_avg dataset containing the average of each variable by subject and activity will be generated from the Data_measurments dataset.

We will use a subset of the data:
UCI HAR Dataset/features.txt        -> index and features
UCI HAR Dataset/activity_labels.txt -> index and activities

Generate a list of the relevant data features containing (mean/std)

Make a table of relevant data from the train data cbind these 3
UCI HAR Dataset/train/X_train.txt   -> keep relevant data
UCI HAR Dataset/train/Y_train.txt   -> Activity data
UCI HAR Dataset/train/subject_train.txt -> Subject data

Make a table of relevant data from the test data cbind these 3
UCI HAR Dataset/test/X_test.txt   -> keep relevant data
UCI HAR Dataset/test/Y_test.txt   -> Activity data
UCI HAR Dataset/test/subject_test.txt -> Subject data

Merge the train and test datasets, clean up the formatting by making the Subject Num and Activity descriptive factors.

Melt/cast the dataset to get the mean values for the variables grouped by subject number and activity.

Save the dataset to a file.

Data_subject_activity.txt: (the output file)
*********************************************************************
This file contains the mean values for the relevant (mean and standard deviation) measurements grouped by subject and activity.

Column names:
SubjectNumber   <- a unique subject number (factor)
Activity        <- a descripion of the activity (factor)
	WALKING
        WALKING_UPSTAIRS
        WALKING_DOWNSTAIRS
        SITTING
        STANDING
        LAYING

(and columns for the means of each of the relevant measurements): tBodyAcc-mean-X,tBodyAcc-mean-Y,tBodyAcc-mean-Z,tBodyAcc-std-X,tBodyAcc-std-Y,tBodyAcc-std-Z,tGravityAcc-mean-X,tGravityAcc-mean-Y,tGravityAcc-mean-Z,tGravityAcc-std-X,tGravityAcc-std-Y,tGravityAcc-std-Z,tBodyAccJerk-mean-X,tBodyAccJerk-mean-Y,tBodyAccJerk-mean-Z,tBodyAccJerk-std-X,tBodyAccJerk-std-Y,tBodyAccJerk-std-Z,tBodyGyro-mean-X,tBodyGyro-mean-Y,tBodyGyro-mean-Z,tBodyGyro-std-X,tBodyGyro-std-Y,tBodyGyro-std-Z,tBodyGyroJerk-mean-X,tBodyGyroJerk-mean-Y,tBodyGyroJerk-mean-Z,tBodyGyroJerk-std-X,tBodyGyroJerk-std-Y,tBodyGyroJerk-std-Z,tBodyAccMag-mean,tBodyAccMag-std,tGravityAccMag-mean,tGravityAccMag-std,tBodyAccJerkMag-mean,tBodyAccJerkMag-std,tBodyGyroMag-mean,tBodyGyroMag-std,tBodyGyroJerkMag-mean,tBodyGyroJerkMag-std,fBodyAcc-mean-X,fBodyAcc-mean-Y,fBodyAcc-mean-Z,fBodyAcc-std-X,fBodyAcc-std-Y,fBodyAcc-std-Z,fBodyAccJerk-mean-X,fBodyAccJerk-mean-Y,fBodyAccJerk-mean-Z,fBodyAccJerk-std-X,fBodyAccJerk-std-Y,fBodyAccJerk-std-Z,fBodyGyro-mean-X,fBodyGyro-mean-Y,fBodyGyro-mean-Z,fBodyGyro-std-X,fBodyGyro-std-Y,fBodyGyro-std-Z,fBodyAccMag-mean,fBodyAccMag-std,fBodyBodyAccJerkMag-mean,fBodyBodyAccJerkMag-std,fBodyBodyGyroMag-mean,fBodyBodyGyroMag-std,fBodyBodyGyroJerkMag-mean,fBodyBodyGyroJerkMag-std