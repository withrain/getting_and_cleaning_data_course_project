# Johns Hopkins's Cousera Signature Track 
# Getting and Cleaning Data Course Project
# Make a tidy data set 

# Step 1. Merges the training and the test sets to create one data set
# Read train/test data sets and bind it
X_train <- read.table("X_train.txt")
X_test <- read.table("X_test.txt")
X <- rbind(X_train, X_test)
# read features data
features <- read.table("features.txt")
names(X) <- features$V2

# Step 2. Extracts only measurements on the mean and standard deviation for each measurement
X_extract = X[grep("mean\\(\\)|std\\(\\)", features$V2)]

# Step 3. Uses descriptive activity names to name the activities in the data set
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

# Step 4. Appropriately labels the data set with descriptive variable names
names(X_final) <- sub("^f", "Frequency", 
                      sub("^t", "Time", 
                          sub("BodyBody", "Body", 
                              sub("\\(\\)", "", names(X_final)))))

# Step 5. From the data set in step 4. creates a second, independent tidy data set 
# with the average of each variable for each activity and each subject
library(plyr)
X_second_final = ddply(X_final, .(Subject, Activity), numcolwise(mean))

write.table(X_second_final, "tidy_data.txt", row.names=FALSE)
