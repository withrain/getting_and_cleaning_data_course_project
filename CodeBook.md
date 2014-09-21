# CodeBook for Getting and Cleaning Data's Course Project

## Raw Data
Here is the data set available at http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones, derived from the original "Human Activity Recognition Using Smartphones Data Set".

## Features
Refering to the README.txt and features.txt files int the data set, You will learn more about the features for the data set with the following description.

> The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz.

> Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

> Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

It is the reasoning of features of mine that the assignment clearly specifies "Extracts only the measurements on the mean and standard deviation for each measurement."
My inclusion completely covers all variables related to mean or standard deviation.

* mean(): Mean value
* std(): Standard deviation

No other estimates has remained for the exercise.

## Transformation

* Read X_train.txt and X_test.txt and bind to row (10299x561 dimension)
* Read features.txt and set column name to the merged data set
* Extract mean, std columns using grep function with regular expression (10299x66 dimension)
* Read subject_train.txt, subject_test.txt and y_train.txt, y_test.txt, add columns to the merged data set (10299x68 dimension)
* Read activity_labels.txt and set activity names to name the activities in Activity column
* Replace column names to descriptive variable names for tidy data set by multiple sub function
* Calculate the average for each subject and each activity using ddply function (180x68 dimension)
* Write the data set to tidy_data.txt

## Variables

Final Data set is X\_second_final(180x68 dimension). This data set is saved to a file named "tidy\_data.txt".
The details of data set variables are as below.

* Subject: It is derived from "subject\_train.txt" and "subject_test.txt" that an integer value specifies a unique participant identifier in the scale of 1 - 30.
* Activity: It is derived from "activitiy_label.txt" that a factor describes the type of measured activity.
	- Walking (1)
	- Walking Upstairs (2)
	- Walking Downstairs (3)
	- Sitting (4)
	- Standing (5)
	- Laying (6)

There are left 66 variables for the measurements of each subject and activity. The following tells you the variable names and the source variable names originated from features.txt but revised.

	1. Removed parenthesis ()
	2. Replace BodyBody with Body
	3. Replace -mean, -std with Mean, Std using Perl style regular expression
	4. Replace prefix t with Time
	5. Replace prefix f with Frequency

The following uppercases remain due to the more readable TimeBodyAccMeanX than timeboxaccmeanx

Source Feature name|My Variable name
-------|-------
tBodyAcc-mean()-X|TimeBodyAccMeanX
tBodyAcc-mean()-Y|TimeBodyAccMeanY
tBodyAcc-mean()-Z|TimeBodyAccMeanZ
tBodyAcc-std()-X|TimeBodyAccStdX
tBodyAcc-std()-Y|TimeBodyAccStdY
tBodyAcc-std()-Z|TimeBodyAccStdZ
tGravityAcc-mean()-X|TimeGravityAccMeanX
tGravityAcc-mean()-Y|TimeGravityAccMeanY
tGravityAcc-mean()-Z|TimeGravityAccMeanZ
tGravityAcc-std()-X|TimeGravityAccStdX
tGravityAcc-std()-Y|TimeGravityAccStdY
tGravityAcc-std()-Z|TimeGravityAccStdZ
tBodyAccJerk-mean()-X|TimeBodyAccJerkMeanX
tBodyAccJerk-mean()-Y|TimeBodyAccJerkMeanY
tBodyAccJerk-mean()-Z|TimeBodyAccJerkMeanZ
tBodyAccJerk-std()-X|TimeBodyAccJerkStdX
tBodyAccJerk-std()-Y|TimeBodyAccJerkStdY
tBodyAccJerk-std()-Z|TimeBodyAccJerkStdZ
tBodyGyro-mean()-X|TimeBodyGyroMeanX
tBodyGyro-mean()-Y|TimeBodyGyroMeanY
tBodyGyro-mean()-Z|TimeBodyGyroMeanZ
tBodyGyro-std()-X|TimeBodyGyroStdX
tBodyGyro-std()-Y|TimeBodyGyroStdY
tBodyGyro-std()-Z|TimeBodyGyroStdZ
tBodyGyroJerk-mean()-X|TimeBodyGyroJerkMeanX
tBodyGyroJerk-mean()-Y|TimeBodyGyroJerkMeanY
tBodyGyroJerk-mean()-Z|TimeBodyGyroJerkMeanZ
tBodyGyroJerk-std()-X|TimeBodyGyroJerkStdX
tBodyGyroJerk-std()-Y|TimeBodyGyroJerkStdY
tBodyGyroJerk-std()-Z|TimeBodyGyroJerkStdZ
tBodyAccMag-mean()|TimeBodyAccMagMean
tBodyAccMag-std()|TimeBodyAccMagStd
tGravityAccMag-mean()|TimeGravityAccMagMean
tGravityAccMag-std()|TimeGravityAccMagStd
tBodyAccJerkMag-mean()|TimeBodyAccJerkMagMean
tBodyAccJerkMag-std()|TimeBodyAccJerkMagStd
tBodyGyroMag-mean()|TimeBodyGyroMagMean
tBodyGyroMag-std()|TimeBodyGyroMagStd
tBodyGyroJerkMag-mean()|TimeBodyGyroJerkMagMean
tBodyGyroJerkMag-std()|TimeBodyGyroJerkMagStd
fBodyAcc-mean()-X|FrequencyBodyAccMeanX
fBodyAcc-mean()-Y|FrequencyBodyAccMeanY
fBodyAcc-mean()-Z|FrequencyBodyAccMeanZ
fBodyAcc-std()-X|FrequencyBodyAccStdX
fBodyAcc-std()-Y|FrequencyBodyAccStdY
fBodyAcc-std()-Z|FrequencyBodyAccStdZ
fBodyAccJerk-mean()-X|FrequencyBodyAccJerkMeanX
fBodyAccJerk-mean()-Y|FrequencyBodyAccJerkMeanY
fBodyAccJerk-mean()-Z|FrequencyBodyAccJerkMeanZ
fBodyAccJerk-std()-X|FrequencyBodyAccJerkStdX
fBodyAccJerk-std()-Y|FrequencyBodyAccJerkStdY
fBodyAccJerk-std()-Z|FrequencyBodyAccJerkStdZ
fBodyGyro-mean()-X|FrequencyBodyGyroMeanX
fBodyGyro-mean()-Y|FrequencyBodyGyroMeanY
fBodyGyro-mean()-Z|FrequencyBodyGyroMeanZ
fBodyGyro-std()-X|FrequencyBodyGyroStdX
fBodyGyro-std()-Y|FrequencyBodyGyroStdY
fBodyGyro-std()-Z|FrequencyBodyGyroStdZ
fBodyAccMag-mean()|FrequencyBodyAccMagMean
fBodyAccMag-std()|FrequencyBodyAccMagStd
fBodyBodyAccJerkMag-mean()|FrequencyBodyAccJerkMagMean
fBodyBodyAccJerkMag-std()|FrequencyBodyAccJerkMagStd
fBodyBodyGyroMag-mean()|FrequencyBodyGyroMagMean
fBodyBodyGyroMag-std()|FrequencyBodyGyroMagStd
fBodyBodyGyroJerkMag-mean()|FrequencyBodyGyroJerkMagMean
fBodyBodyGyroJerkMag-std()|FrequencyBodyGyroJerkMagStd
