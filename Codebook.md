# Code Book - Getting and Cleaning Data - Final Project

## Data Files

#### The downloaded zip contained several files, after opening most of them and seeing their structure, these are the needed files for the assignment:

* activity_labels.txt (labels for the 6 activities
* features.txt (names of the 561 variables [columns])
* subject_test.txt (number of each of the 30 subjects)
* subject_train.txt (number of each of the 30 subjects)
* X_test.txt (observations of the testing group)
* X_train.txt (observations of the training group)
* y_test.txt (number which identifies one of the 6 activities)
* y_train.txt (number which identifies one of the 6 activities)

#### The script run_analysis does the following:

1. Read the 6 txt files into R as datasets
2. Bind (by rows) the two sets the two sets of training and testing data:
x_train + x_test; y_train + y_test; subject_train + subject_test 
3. Creates the Tidy data set with the averages of each activity
4. Writes the Tidy Data Set to disk (tidyData.txt)
5. Creates a second Tidy data Set with only the Averages per Activity 
6. Writes the Tidy Averages data set to disk (tidyAverage.txt)