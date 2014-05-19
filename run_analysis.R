#==============================================================================
#                   Getting and Cleaning - Final Project
#==============================================================================
#
# Original Data: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
# Original Data Description: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
#



# Opening Reshape library
library("reshape2")


# Reading label files
activities <- read.table(paste0("activity_labels.txt"), header=FALSE, 
                         stringsAsFactors=FALSE)
features <- read.table(paste0("features.txt"), header=FALSE, 
                       stringsAsFactors=FALSE)

# Preparing Test Data
subject_test <- read.table(paste0("subject_test.txt"), header=FALSE)
x_test <- read.table(paste0("x_test.txt"), header=FALSE)
y_test <- read.table(paste0("y_test.txt"), header=FALSE)
tmp <- data.frame(Activity = factor(y_test$V1, labels = activities$V2))
testData <- cbind(tmp, subject_test, x_test)


# Preparing Training Data
subject_train <- read.table(paste0("subject_train.txt"), header=FALSE)
x_train <- read.table(paste0("X_train.txt"), header=FALSE)
y_train <- read.table(paste0("y_train.txt"), header=FALSE)
tmp <- data.frame(Activity = factor(y_train$V1, labels = activities$V2))
trainData <- cbind(tmp, subject_train, x_train)


# Tidy Data Set from Mean and STD
tmpTidyData <- rbind(testData, trainData)
names(tmpTidyData) <- c("Activity", "Subject", features[,2])
select <- features$V2[grep("mean\\(\\)|std\\(\\)", features$V2)]
tidyData <- tmpTidyData[c("Activity", "Subject", select)]
write.table(tidyData, file="./tidyData.txt", row.names=FALSE)

# Tidy Data Average/Activity
tidyDataMelt <- melt(tidyData, id=c("Activity", "Subject"), measure.vars=select)
tidyDataMean <- dcast(tidyDataMelt, Activity + Subject ~ variable, mean)


# Write Tidy Average Data
write.table(tidyDataMean, file="./tidyAverage.txt", row.names=FALSE)

