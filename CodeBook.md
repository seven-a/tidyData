
This file describes the variables, the data, and all transformations that was performed to clean up the data.

## Variables
Resulting data set "tidyData.txt" contains the average of each variable for each activity and each subject (for each subject-activity pair). 
First two coulumns of resulting data are subject and activity. Subject-activity pair is unique for the dataset. There are 30 subjects and 6 activities (180 observations in total).

Names of the coulumns shows the variable which was observed. 


## Cleaning
Script run_analysis.R does the following:
Initial check if "./samsung data" folder is in the working directiry, if no shows a message.
Merges the training and the test sets from raw data to create one data set.
Extracts only the measurements on the mean and standard deviation for each measurement.
Uses descriptive activity names to name the activities in the data set
Labels the data set with descriptive variable names.
Creates a tidy data set with the average of each variable for each activity and each subject.

Resulting data set "tidyData.txt" appears in the working directory afterperforming the script and is shown in this repo too.
