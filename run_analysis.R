## load libraries
library("plyr")
library("dplyr")
library("tidyr")

## starting point is that the UCI folder is unzipped in the root of the working directory

## convert the features file into a character vector
## first read it in as delimited NOT table. Header must be false else loose first value
features<-read.delim("UCI HAR Dataset//features.txt",header=FALSE)

## then transpose
t_features<-t(features)

## then turn to character
t_feature_ch<-as.character(t_features)

## load large vector using read table, the character vector as col.names and no header

X_vector<-read.table("UCI HAR Dataset/test/X_test.txt", col.names=t_feature_ch, header=FALSE)
X_vector_train<-read.table("UCI HAR Dataset/train/X_train.txt", col.names=t_feature_ch, header=FALSE)
## dimensions should be 2947 obs of 561 variables

## crop before bind

## take column names from X_vector

col_names<-colnames(X_vector)
col_names<-tbl_df(data.frame(col_names))
colnames(col_names)[1]<-"Variable_Names"

## mutate to add grepl columns for mean and standard
col_names<-mutate(col_names, Contains_Mean=grepl("mean",Variable_Names))
col_names<-mutate(col_names, Contains_STD=grepl("std",Variable_Names))

## add a column of column numbers by counting nrows and then making a vector 1:nrows and converting to table and cbind
no_rows<-nrow(col_names)
num_vector<-1:no_rows
num_vector<-tbl_df(data.frame(num_vector))
col_names<-cbind(col_names,num_vector)
## filter based on NOT(both mean and std = false)
filtered_col_names<-filter(col_names,!(Contains_Mean==FALSE&Contains_STD==FALSE))
## create column index vector from column ID colum
col_index_vector<-filtered_col_names$num_vector
## use select=column IDs to subset X_vector
X_vector<-subset(X_vector,select=col_index_vector)
X_vector_train<-subset(X_vector_train,select=col_index_vector)
## read in activity_ID from Y_test

activity_ID<-read.table("UCI HAR Dataset/test/y_test.txt",col.names="Activity_ID",header=FALSE)
activity_ID_train<-read.table("UCI HAR Dataset/train/y_train.txt",col.names="Activity_ID",header=FALSE)
## read in subject_ID from subject_test

subject_ID<-read.table("UCI HAR Dataset/test/subject_test.txt", col.names="Subject_ID", header=FALSE)
subject_ID_train<-read.table("UCI HAR Dataset/train/subject_train.txt",col.names="Subject_ID",header=FALSE)
## clip together in one dataset

clipped_test_output<-cbind(subject_ID, activity_ID, X_vector)
clipped_train_output<-cbind(subject_ID_train, activity_ID_train, X_vector_train)

## remove working files

rm(X_vector,X_vector_train,activity_ID,activity_ID_train,col_names)
rm(col_index_vector,no_rows,t_feature_ch,t_features,num_vector)
rm(features,filtered_col_names,subject_ID,subject_ID_train)

## add test and train columns respectively

clipped_test_output<-mutate(clipped_test_output,source="TEST")
clipped_train_output<-mutate(clipped_train_output, source="TRAIN")
## combine the two data sets
combined_data<-rbind(clipped_test_output, clipped_train_output)


## create table of activity labels

activity_labels<-read.table("UCI HAR Dataset/activity_labels.txt",col.names=c("activity_ID","Activity_Label"),header=FALSE)

## merge activity_labels with combined data

merged_data<-merge(activity_labels,combined_data,by.x="activity_ID",by.y="Activity_ID")

## convert ctivity label class from factor to character

merged_data$Activity_Label<-as.character(merged_data$Activity_Label)

## tidy names slightly

original<-colnames(merged_data)
names_table<-tbl_df(data.frame(original))
names_table<-mutate(names_table,next_name=gsub("[...]",original,replacement="_"))
next_names<-names_table$next_name
colnames(merged_data)<-next_names

## remove working files

rm(clipped_test_output,clipped_train_output)
rm(activity_labels,combined_data)
rm(original, next_names, names_table)

## wrap merged data

merged_data<-tbl_df(merged_data)