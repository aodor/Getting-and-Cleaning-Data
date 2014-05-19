README.MD
========================================================

#### All necessary data files for this project are in the same directory as this *readme.md* and the script file *run_analysys.R*

#### The sequence of the script is described in the Code Book, and includes:

1. Read the 6 txt files into R as datasets
2. Bind (by rows) the two sets the two sets of training and testing data:
x_train + x_test; y_train + y_test; subject_train + subject_test 
3. Creates the Tidy data set with the averages of each activity
4. Writes the Tidy Data Set to disk (tidyData.txt)
5. Creates a second Tidy data Set with only the Averages per Activity 
6. Writes the Tidy Averages data set to disk (tidyAverage.txt)