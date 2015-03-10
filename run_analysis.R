## load libraries
library("plyr")
library("dplyr")
library("tidyr")

## Create Clipped Train Data
## first read in files

X_train<-read.table("UCI HAR Dataset/train/X_train.txt")
Y_train<-read.delim("UCI HAR Dataset//train//y_train.txt", col.names="Activity_ID", header=FALSE)
train_subject<-read.delim("UCI HAR Dataset//train//subject_train.txt", col.names="Subject_ID", header=FALSE)

## create combined data for Train

train_combined<-cbind(X_train,Y_train,train_subject)

## Create Clipped TEST Data
## first read in files

X_test<-read.delim("UCI HAR Dataset/test/X_test.txt", col.names="Measurements_Vector", header=FALSE)
Y_test<-read.delim("UCI HAR Dataset//test//y_test.txt", col.names="Activity_ID", header=FALSE)
test_subject<-read.delim("UCI HAR Dataset//test//subject_test.txt", col.names="Subject_ID", header=FALSE)

## create combined data for TEST

test_combined<-cbind(X_test, Y_test, test_subject)

## wrap both data sets

train_combined<-tbl_df(train_combined)
test_combined<-tbl_df(test_combined)

## add source column to each

train_combined_M<-mutate(train_combined, source="Train Group")
test_combined_M<-mutate(test_combined, source="Test Group")

## rbind the two together

working_data_set<-rbind(train_combined_M,test_combined_M)

## remove working values
rm(X_train)
rm(Y_train)
rm(train_subject)
rm(X_test)
rm(Y_test)
rm(test_subject)
rm(train_combined)
rm(test_combined)
rm(train_combined_M)
rm(test_combined_M)