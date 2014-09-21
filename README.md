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
```
# Read train/test data sets and bind it
X_train <- read.table("X_train.txt")
X_test <- read.table("X_test.txt")
X <- rbind(X_train, X_test)
# read features data
features <- read.table("features.txt")
names(X) <- features$V2
```
Read X\_train.txt and X\_test.txt file --> Two data frame X\_train, X\_test
And bind two variables to X by row with rbind function.
Read another file features.txt and set column names of X data frame.

