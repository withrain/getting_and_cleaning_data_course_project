# Coursera: (Johns Hopkins)Getting and Cleaning Data Course Project

## Introduction

This repository relates to the course project for the "Getting and Cleaning Data" course on https://class.coursera.org/getdata-007.
The source data contains measurements extracted from embedded accelerometer and gyroscope of a Samsung Galaxy S II attached to participants. Each person performed six activities(WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING).

The purpose of this repo is to clean the data set and prepare a tidy data set for data analysis.

A full description is available at the site where the data was obtained:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here are the data for this project:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

## Files

- README.txt: Show overall information
- features_info.txt: Shows information about the variables used on the feature vector.
- features.txt: List of all features.
- activity_labels.txt: Links the class labels with their activity name.
- X_train.txt: Training set.
- y_train.txt: Training labels(activity).
- X_test.txt: Test set.
- y_test.txt: Test labels(activity).
- README.md: This file
- CodeBook.md: Describes the variables, the data, and the work that has been performed.
- run_analysis.R: Analysis script of this repo
- tidy\_data.txt: Tidy data set: output of run_analysis.R

## Usage

The `run_analysis.R` is the script that has been used for this work.

```bash
$ Rscript run_analysis.R
```

It can be loaded in R/Rstudio and executed without any parameters.

## Script Details

Step 1. Merges the training and the test sets to create one data set
```R
# Read train/test data sets and bind it
X_train <- read.table("X_train.txt")
X_test <- read.table("X_test.txt")
X <- rbind(X_train, X_test)
# read features data
features <- read.table("features.txt")
names(X) <- features$V2
```
Read X\_train.txt and X\_test.txt file(now there are two data frame X\_train, X\_test).
And bind two variables to X by row with rbind function. X is 10299x561 dimension.
Read another file features.txt and set column names of X data frame.

Step 2. Extracts only measurements on the mean and standard deviation for each measurement
```R
X_extract = X[grep("mean\\(\\)|std\\(\\)", features$V2)]
```
To find a mean and standard deviation variables, I use grep function with features data frame
and get indexes of variables I want.
X\_extract is 10299x66 dimension.

Step 3. Uses descriptive activity names to name the activities in the data set
```R
# read subject and activity(y) data set and bind it
subject_train <- read.table("subject_train.txt")
subject_test <- read.table("subject_test.txt")
subject <- rbind(subject_train, subject_test)
names(subject) <- c("Subject")
activity_train  <- read.table("y_train.txt")
activity_test  <- read.table("y_test.txt")
activity <- rbind(activity_train, activity_test)
names(activity) <- c("Activity")
# bind subject, activity to X
X_final <- cbind(subject, activity, X_extract)
# set descriptive activity names
activity_labels = read.table("activity_labels.txt")
X_final$Activity <- factor(X_final$Activity, labels = activity_labels$V2)
```
Read two subject files and rbind to subject data frame(10299x1 dimension).
And read two activity files and rbind to activity data frame(10299x1 dimension).
Bind three data frame - subject, activity, X\_extract - by column to X\_final data frame(10299x68 dimension).
To set descriptive name to Activity variable, use factor function and the label data derived from activity\_labels.txt

Step 4. Appropriately labels the data set with descriptive variable names
```R
names(X_final) <- sub("^f", "Frequency", 
                      sub("^t", "Time", 
                          sub("-(.)([^-]*)-?", "\\U\\1\\E\\2",
                              sub("BodyBody", "Body", 
                                  sub("\\(\\)", "", names(X_final))
                                  )
                              , perl=TRUE)
                          )
                      )
```
For tidy data set, I modify variable names more descriptive using multiple sub function.
- `sub("\\(\\)", ""` Removed parenthesis ()
- `sub("BodyBody", "Body"` Replace BodyBody with Body
- `sub("-(.)([^-]*)-?", "\\U\\1\\E\\2"` Replace -mean, -std with Mean, Std using Perl style regular expression. \\U convert following characters to uppercase. \\E turn off case conversion. I set option perl=TRUE to use \\U, \\E.
- `sub("^t", "Time"` Replace prefix t with Time
- `sub("^f", "Frequency"` Replace prefix f with Frequency


Step 5. From the data set in step 4, creates a second and independent tidy data set 
```R
# with the average of each variable for each activity and each subject
library(plyr)
X_second_final = ddply(X_final, .(Subject, Activity), numcolwise(mean))

write.table(X_second_final, "tidy_data.txt", row.names=FALSE)
```
Finally, I calculate the average of each numerical variables for each subject and each activity.
I use ddply function of plyr package and numcolwise function to make X\_second\_final data frame(180x68 dimension).
And write X\_second\_final data frame to "tidy\_data.txt" file.