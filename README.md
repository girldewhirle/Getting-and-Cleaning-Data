# Getting-and-Cleaning-Data
Course Project for Getting and Cleaning Data Coursera Course - March 2015

**NB**: this readme details how the run_analysis.R script cleans and tidies the data set to produce the final_output tidy data set.  For details of the variables within that data set please see the accompanying CodeBook.

Original data for analysis can be found here:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The run_analysis.R file is based on a working directory which contains the unzipped 'UCI HAR Dataset'

The script uses the following files from the data set.

Labels and Variable Names:

UCI HAR Dataset/features.txt
UCI HAR Dataset/activity_labels.txt

Test Data:

UCI HAR Dataset/test/X_test.txt
UCI HAR Dataset/test/subject_test.txt
UCI HAR Dataset/test/y_test.txt

Train Data:

UCI HAR Dataset/train/X_train.txt
UCI HAR Dataset/train/subject_train.txt
UCI HAR Dataset/train/y_train.txt

The script has the following prereqs and will load the libraries:

* plyr
* dplyr
* tidyr

The script is commented at each stage and follows the following process:

* read in the features file as a delimited file and then converts the column it into a character vector
* using gsub on this vector the brackets (parentheses) are removed from the variable names
* this features character vector is used as the column names vector when the X_test and X_train files are loaded with read.table.  Read.table is used here rather than read.delim to ensure that the 561 features in the vector are split into individual variables
* from the X_test file that is loaded in (it is abitary here which file test or train is used at this point) the column names are extracted and converted into a data.frame (tbl.df is used to allow for ease of manipulation)
* grepl is used to identify which variables contain 'mean' and/or 'std'
* a column is added with row numbers and the data.frame is then filtered to only show those column names that contain mean and/or std
* the column numbers from this filtered table are then extracted into a character vector
* this character vector (from the filtered column numbers) is used as the 'select' parameter to subset the X_test and X_train data
* for test and for train the activity ID (from Y file) and the subject ID (from the subject file) are read into the workspace
* cbind is used to clip the test and train sets together - X_test + Y_test + subject_test = test data; X_train + Y_train + subject_train = train data
* add a 'source' column to both data.frames denoting if data came from test or train
* use rbind to combine the test and train data into one set (combined_data)
* read in the activity_labels file and use merge to add a column to the combined_data with the descriptive labels of the activities (matching on the activity id)
* for each unique combination of activity and subject the mean of the features variables is calcualted.  In practice this is achieved by looping over the table using the activity label and subject id. For each pass of the loop the mean of each variable in the table is calculated by creating a subset and using lapply to run mean on each variable.  Note, this will cause warning messages when the none feature fields will produce NAs as their output - these are subsequently removed. Each pass binds the output to a data frame (created just before the loop based on the same variables but no observations)
* the activity labels are merged into this data extract
* surprus columns (source, activity ID for example) are removed from the final_output
* the working files created through the process are removed
* the final_output file is written to the workspace.  Note - this is commented out in the script as has already been run to create the submitted file.  If it is uncommented the destination file (currently final_output) may need to be renamed


