# CodeBook for Getting and Cleaning Data's Course Project

## Data source
This dataset is derived from the "Human Activity Recognition Using Smartphones Data Set" which was originally made avaiable here: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

###Feature Selection 
I refer you to the README.txt and features.txt files in the original dataset to learn more about the feature selection for this dataset. And there you will find the follow description:

> The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 
Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 
Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

The reasoning behind my selection of features is that the assignment explicitly states "Extracts only the measurements on the mean and standard deviation for each measurement."
To be complete, I included all variables having to do with mean or standard deviation.

* mean(): Mean value
* std(): Standard deviation

Other estimates have been removed for the purpose of this excercise.

## Variables

* Subject: An integer value specifying a unique participant identifier in the range 1 to 30. There are derived from "subject\_train.txt" and "subject_test.txt"
* Activity: A factor describing the type of activity being measured. There are 6 activities derived from "activitiy_label.txt"
	- Walking (1)
	- Walking Upstairs (2)
	- Walking Downstairs (3)
	- Sitting (4)
	- Standing (5)
	- Laying (6)

The remaining variables are the measurements for each subject and activity. The following table shows the variable names and the source variable names (from features.txt).

Source feature name|Variable name
-------|-------
tBodyAcc-mean()-X|TimeBodyAcc-mean-X
tBodyAcc-mean()-Y|TimeBodyAcc-mean-Y
tBodyAcc-mean()-Z|TimeBodyAcc-mean-Z
tBodyAcc-std()-X|TimeBodyAcc-std-X
tBodyAcc-std()-Y|TimeBodyAcc-std-Y
tBodyAcc-std()-Z|TimeBodyAcc-std-Z
tGravityAcc-mean()-X|TimeGravityAcc-mean-X
tGravityAcc-mean()-Y|TimeGravityAcc-mean-Y
tGravityAcc-mean()-Z|TimeGravityAcc-mean-Z
tGravityAcc-std()-X|TimeGravityAcc-std-X
tGravityAcc-std()-Y|TimeGravityAcc-std-Y
tGravityAcc-std()-Z|TimeGravityAcc-std-Z
tBodyAccJerk-mean()-X|TimeBodyAccJerk-mean-X
tBodyAccJerk-mean()-Y|TimeBodyAccJerk-mean-Y
tBodyAccJerk-mean()-Z|TimeBodyAccJerk-mean-Z
tBodyAccJerk-std()-X|TimeBodyAccJerk-std-X
tBodyAccJerk-std()-Y|TimeBodyAccJerk-std-Y
tBodyAccJerk-std()-Z|TimeBodyAccJerk-std-Z
tBodyGyro-mean()-X|TimeBodyGyro-mean-X
tBodyGyro-mean()-Y|TimeBodyGyro-mean-Y
tBodyGyro-mean()-Z|TimeBodyGyro-mean-Z
tBodyGyro-std()-X|TimeBodyGyro-std-X
tBodyGyro-std()-Y|TimeBodyGyro-std-Y
tBodyGyro-std()-Z|TimeBodyGyro-std-Z
tBodyGyroJerk-mean()-X|TimeBodyGyroJerk-mean-X
tBodyGyroJerk-mean()-Y|TimeBodyGyroJerk-mean-Y
tBodyGyroJerk-mean()-Z|TimeBodyGyroJerk-mean-Z
tBodyGyroJerk-std()-X|TimeBodyGyroJerk-std-X
tBodyGyroJerk-std()-Y|TimeBodyGyroJerk-std-Y
tBodyGyroJerk-std()-Z|TimeBodyGyroJerk-std-Z
tBodyAccMag-mean()|TimeBodyAccMag-mean
tBodyAccMag-std()|TimeBodyAccMag-std
tGravityAccMag-mean()|TimeGravityAccMag-mean
tGravityAccMag-std()|TimeGravityAccMag-std
tBodyAccJerkMag-mean()|TimeBodyAccJerkMag-mean
tBodyAccJerkMag-std()|TimeBodyAccJerkMag-std
tBodyGyroMag-mean()|TimeBodyGyroMag-mean
tBodyGyroMag-std()|TimeBodyGyroMag-std
tBodyGyroJerkMag-mean()|TimeBodyGyroJerkMag-mean
tBodyGyroJerkMag-std()|TimeBodyGyroJerkMag-std
fBodyAcc-mean()-X|FrequencyBodyAcc-mean-X
fBodyAcc-mean()-Y|FrequencyBodyAcc-mean-Y
fBodyAcc-mean()-Z|FrequencyBodyAcc-mean-Z
fBodyAcc-std()-X|FrequencyBodyAcc-std-X
fBodyAcc-std()-Y|FrequencyBodyAcc-std-Y
fBodyAcc-std()-Z|FrequencyBodyAcc-std-Z
fBodyAccJerk-mean()-X|FrequencyBodyAccJerk-mean-X
fBodyAccJerk-mean()-Y|FrequencyBodyAccJerk-mean-Y
fBodyAccJerk-mean()-Z|FrequencyBodyAccJerk-mean-Z
fBodyAccJerk-std()-X|FrequencyBodyAccJerk-std-X
fBodyAccJerk-std()-Y|FrequencyBodyAccJerk-std-Y
fBodyAccJerk-std()-Z|FrequencyBodyAccJerk-std-Z
fBodyGyro-mean()-X|FrequencyBodyGyro-mean-X
fBodyGyro-mean()-Y|FrequencyBodyGyro-mean-Y
fBodyGyro-mean()-Z|FrequencyBodyGyro-mean-Z
fBodyGyro-std()-X|FrequencyBodyGyro-std-X
fBodyGyro-std()-Y|FrequencyBodyGyro-std-Y
fBodyGyro-std()-Z|FrequencyBodyGyro-std-Z
fBodyAccMag-mean()|FrequencyBodyAccMag-mean
fBodyAccMag-std()|FrequencyBodyAccMag-std
fBodyBodyAccJerkMag-mean()|FrequencyBodyAccJerkMag-mean
fBodyBodyAccJerkMag-std()|FrequencyBodyAccJerkMag-std
fBodyBodyGyroMag-mean()|FrequencyBodyGyroMag-mean
fBodyBodyGyroMag-std()|FrequencyBodyGyroMag-std
fBodyBodyGyroJerkMag-mean()|FrequencyBodyGyroJerkMag-mean
fBodyBodyGyroJerkMag-std()|FrequencyBodyGyroJerkMag-std
