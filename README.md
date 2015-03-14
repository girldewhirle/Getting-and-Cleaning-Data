# Getting-and-Cleaning-Data
Course Project for Getting and Cleaning Data Coursera Course - March 2015

Original data for analysis can be found here:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The run_analysis.R file is based on a working directory which contains the unzipped 'UCI HAR Dataset'

The script creates a data set using the following files:

UCI HAR Dataset/features.txt
UCI HAR Dataset/activity_labels.txt

UCI HAR Dataset/test/X_test.txt
UCI HAR Dataset/test/subject_test.txt
UCI HAR Dataset/test/y_test.txt

The script will load the following libraries:

* plyr
* dplyr
* tidyr


## convert the features file into a character vector
## first read it in as delimited NOT table. Header must be false else loose first value
## then transpose
## then turn to character
## load large vector using read table, the character vector as col.names and no header
## dimensions should be 2947 obs of 561 variables
## crop before bind
## take column names from X_vector
## mutate to add grepl columns for mean and standard
## add a column of column numbers by counting nrows and then making a vector 1:nrows and converting to table and cbind
## filter based on NOT(both mean and std = false)
## create column index vector from column ID colum
## use select=column IDs to subset X_vector
## read in activity_ID from Y_test
## read in subject_ID from subject_test
## clip together in one dataset
## add test and train columns respectively
## combine the two data sets
## create table of activity labels
## merge activity_labels with combined data
## convert ctivity label class from factor to character
