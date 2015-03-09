used download file on https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
then unzipped
created a 'full files' variable
only got the top level directories
want to understand what's in the data folders first - trying and make a 'readable' version of test and training
pull in x test data into x test df
put into data table called xtest_table
pull each file into an r object

naming convention - start with root and the for subfolders test or train

try to separate x and y data
column names is the features info as a vector - created by reading in the file using col.names=c("Variables") and header=FALSE
x and y data is 256 obs in 1 column - the variables are listed in features

remember to pull in each text file with headers and then convert into tbl_dt

---

For Test Folder:

test_X_test<-read.delim("UCI HAR Dataset/test/X_test.txt",header=FALSE,col.names="X_vari")
test_Y_test<-read.delim("UCI HAR Dataset/test/Y_test.txt",header=FALSE,col.names="Y_vari")
test_subject_test<-read.delim("UCI HAR Dataset/test/subject_test.txt",header=FALSE,col.names="Subject_Test")

Create source column in each using mutate and name with suffix m

Repeat for Train

---

08.03.2015
Create files of 3 train 'variables'.  Use read.delim but set column names and header to false. Do similar for test

09.03.2015

Clip together for train/test - resulting in two data.frames
convert to tables so can use mutate and add a 'source' column to each
Rename consistently
rbind together
