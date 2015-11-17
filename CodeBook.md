# Code Book - Coursera course Getting and Cleaning Data
-----------

## R code implementation
The "run_analysis.R" carries out the following tasks:  

 1. Get the dataset and unzip the file
 2. Load the training and the test sets, and labels the data set with descriptive variable names.
 3. Merge the training and test sets to 'onedata'
 4. Extracts only the measurements on the mean and sd for each measurement. 
 5. Uses descriptive activity names to name the activities in the data set.
 6. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.  

## Main data
Here I list the main data that are used in the R code. 

 - train: train data set, with subject, activity label and features.
 - test: test data set, with subject, activity label and features.
 - onedata: the merged train and test data.
 - onedata_meansd: the merged data, with only the measurements on the mean and sd for each measurement.
 - mean_data: a second, independent tidy data set with the average of each variable for each activity and each subject. 

## Output tidy data
The txt file "mean_data.txt" is the output file as required by the project. The data could be loaded by command:
> mean_data<-read.table("mean_data.txt")

The first two columns are the subjects and the activity labels, followed by the mean of each variable. The subject, activity label and variable are all described in the column names. 


