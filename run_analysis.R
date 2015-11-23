# Course Project GCD

# Input files

# Load all test files
activitylabels_y_test <- read.table("./UCIHARDataset/test/y_test.txt", sep = "")

testset_x_test <- read.table("./UCIHARDataset/test/X_test.txt", sep = "")

subjectid_test <- read.table("./UCIHARDataset/test/subject_test.txt", sep = "")

# Load all train files
activitylabels_y_train <- read.table("./UCIHARDataset/train/y_train.txt", sep = "")

trainset_x_train <- read.table("./UCIHARDataset/train/X_train.txt", sep = "")

subjectid_train <- read.table("./UCIHARDataset/train/subject_train.txt", sep = "")


#Rename activity codes to actual activity name
activitylabels_y_test[which(activitylabels_y_test==1),] <- "WALKING"
activitylabels_y_test[which(activitylabels_y_test==2),] <- "WALKING_UPSTAIRS"
activitylabels_y_test[which(activitylabels_y_test==3),] <- "WALKING_DOWNSTAIRS"
activitylabels_y_test[which(activitylabels_y_test==4),] <- "SITTING"
activitylabels_y_test[which(activitylabels_y_test==5),] <- "STANDING"
activitylabels_y_test[which(activitylabels_y_test==6),] <- "LAYING"

activitylabels_y_train[which(activitylabels_y_train==1),] <- "WALKING"
activitylabels_y_train[which(activitylabels_y_train==2),] <- "WALKING_UPSTAIRS"
activitylabels_y_train[which(activitylabels_y_train==3),] <- "WALKING_DOWNSTAIRS"
activitylabels_y_train[which(activitylabels_y_train==4),] <- "SITTING"
activitylabels_y_train[which(activitylabels_y_train==5),] <- "STANDING"
activitylabels_y_train[which(activitylabels_y_train==6),] <- "LAYING"

# Rename variable names in 1st two columns so the first three variables aren't all "V1"
colnames(subjectid_train) <- c("SUBJECTID")
colnames(subjectid_test) <- c("SUBJECTID")
colnames(activitylabels_y_train) <- c("ACTIVITY")
colnames(activitylabels_y_test) <- c("ACTIVITY")


# STEP 1 - Merge dataframes together
    #1) Merge all test dataframes
    #2) Merge all train dataframes
    #3) Merge test and train dataframes into 1 dataset
test_dataframe <- cbind(subjectid_test, activitylabels_y_test, testset_x_test)
train_dataframe <- cbind(subjectid_train, activitylabels_y_train, trainset_x_train)

test_train_dataset <- rbind(test_dataframe, train_dataframe)

# STEP 2 - Extract only the mean and standard deviation variables for each measurement.
# Measurements are 
    #1) tBodyAcc-XYZ, 2) tGravityAcc-XYZ, 3) tBodyAccJerk-XYZ, 4) tBodyGyro-XYZ, 5) tBodyGyroJerk-XYZ
    # 6) tBodyAccMag, 7) tGravityAccMag, 8) tBodyAccJerkMag, 9)tBodyGyroMag, 10) tBodyGyroJerkMag, 11) fBodyAcc-XYZ
    # 12) fBodyAccJerk-XYZ, 13) fBodyGyro-XYZ, 14) fBodyAccMag, 15)fBodyAccJerkMag, 16)fBodyGyroMag, 17) fBodyGyroJerkMag 
# MEAN AND STANDARD DEVIATIONS are variables
    # 1-6, 41-6, 81-6, 121-6, 161-6, 201-2, 214-5, 227-8, 240-1, 253-4, 266-71, 345-50, 424-9, 503-4, 516-7, 529-30, 542-3.
    # Add 2 to each number above to account for the two additional vriables (columns) added at the 
        # beginning of the dataset through cbind in STEP 1


test_train_subset <- test_train_dataset[, c(1:8, 43:48, 83:88, 123:128, 163:168, 203:204, 216:217, 229:230, 242:243,
                                            255:256, 268:273, 347:352, 426:431, 505:506, 518:519, 531:532, 544:545)]


#STEP 3 - Add descriptive names to the activity variable, but this was done in Step 1.  

# STEP 4 - Label the data set with descriptive variable names

colnames(test_train_subset) <- c("SubjectID", "Activity", "tBodyAccMeanX", "tBodyAccMeanY", "tBodyAccMeanZ", "tBodyAccStdX", "tBodyAccStdY",
                                 "tBodyAccStdZ", "tGravityAccMeanX", "tGravityAccMeanY", "tGravityAccMeanZ", "tGravityAccStdX",
                                 "tGravityAccStdY", "tGravityAccStdZ", "tBodyAccJerkMeanX", "tBodyAccJerkMeanY", "tBodyAccJerkMeanZ",
                                 "tBodyAccJerkStdX", "tBodyAccJerkStdY", "tBodyAccJerkStdZ", "tBodyGyroMeanX", "tBodyGyroMeanY",
                                 "tBodyGyroMeanZ", "tBodyGyroStdX", "tBodyGyroStdY", "tBodyGyroStdZ", "tBodyGyroJerkMeanX",
                                 "tBodyGyroJerkMeanY", "tBodyGyroJerkMeanZ", "tBodyGyroJerkStdX","tBodyGyroJerkStdY","tBodyGyroJerkStdZ",
                                 "tBodyAccMagMean", "tBodyAccMagStd", "tGravityAccMagMean", "tGravityAccMagStd",  "tBodyAccJerkMagMean", 
                                 "tBodyAccJerkMagStd", "tBodyGyroMagMean", "tBodyGyroMagStd", "tBodyGyroJerkMagMean", 
                                 "tBodyGyroJerkMagStd", "fBodyAccMeanX", "fBodyAccMeanY","fBodyAccMeanZ", "fBodyAccStdX", 
                                 "fBodyAccStdY", "fBodyAccStdZ", "fBodyAccJerkMeanX", "fBodyAccJerkMeanY", "fBodyAccJerkMeanZ", 
                                 "fBodyAccJerkStdX","fBodyAccJerkStdY", "fBodyAccJerkStdZ", "fBodyGyroMeanX", "fBodyGyroMeanY", 
                                 "fBodyGyroMeanZ", "fBodyGyroStdX", "fBodyGyroStdY","fBodyGyroStdZ","fBodyAccMagMean", 
                                 "fBodyAccMagStd", "fBodyBodyAccJerkMagMean", "fBodyBodyAccJerkMagStd", "fBodyBodyGyroMagMean", 
                                 "fBodyBodyGyroMagStd", "fBodyBodyGyroJerkMagMean", "fBodyBodyGyroJerkMagStd")


# STEP 5 - Take the average of each measurement variable, for each subject by activity.  Save as a new data frame.


library("dplyr")
Subject_Activity <- group_by(test_train_subset, SubjectID, Activity )
newdf <- summarise_each (Subject_Activity, funs(mean))
newdf

write.table(newdf, "./CourseProject.txt", row.names=FALSE)
