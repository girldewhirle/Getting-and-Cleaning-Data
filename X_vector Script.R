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

## dimensions should be 2947 obs of 561 variables

## read in activity_ID from Y_test

activity_ID<-read.table("UCI HAR Dataset/test/y_test.txt",col.names="Activity ID",header=FALSE)

## read in subject_ID from subject_test

subject_ID<-read.table("UCI HAR Dataset/test/subject_test.txt", col.names="Subject ID", header=FALSE)

## clip together in one dataset

clipped_test_output<-cbind(subject_ID, activity_ID, X_vector)

## remove working files

rm(X_vector)
rm(activity_ID)
rm(t_features)
rm(subject_ID)

## REPEAT FOR TRAIN

## load large vector using read table, the character vector as col.names and no header

X_vector<-read.table("UCI HAR Dataset/train/X_train.txt", col.names=t_feature_ch, header=FALSE)

## dimensions should be 2947 obs of 561 variables

## read in activity_ID from Y_test

activity_ID<-read.table("UCI HAR Dataset/train/y_train.txt",col.names="Activity ID",header=FALSE)

## read in subject_ID from subject_test

subject_ID<-read.table("UCI HAR Dataset/train/subject_train.txt", col.names="Subject ID", header=FALSE)

## clip together in one dataset

clipped_train_output<-cbind(subject_ID, activity_ID, X_vector)

## remove working files

rm(X_vector)
rm(activity_ID)
rm(subject_ID)

