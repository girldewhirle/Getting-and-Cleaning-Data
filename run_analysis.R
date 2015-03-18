## starting point is that the UCI folder is unzipped in the root of the working directory

## load libraries
library("plyr")
library("dplyr")
library("tidyr")

## read in file for features - use read table to be able to split into columns
features_file<-read.table("UCI HAR Dataset/features.txt",header=FALSE)
## pull out column into character format variable
orginal_features_names<-as.character(features_file$V2)
## take out brackets using gsub
changed_names<-gsub("[()]","",x=orginal_features_names)

## load large 'X' vector using read table, the character vector as col.names and no header
X_vector<-read.table("UCI HAR Dataset/test/X_test.txt", col.names=changed_names, header=FALSE)
X_vector_train<-read.table("UCI HAR Dataset/train/X_train.txt", col.names=changed_names, header=FALSE)

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
## clip together in one dataset with the 'X' vector
clipped_test_output<-cbind(subject_ID, activity_ID, X_vector)
clipped_train_output<-cbind(subject_ID_train, activity_ID_train, X_vector_train)

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

## wrap merged data
merged_data<-tbl_df(merged_data)

## need to subset by activity type and subject - create variables that contain all the unique activity labels and subject IDs
unique_labels<-unique(merged_data$Activity_Label)
unique_subject<-unique(merged_data$Subject_ID)

## create empty data frame by filtering existing frame using logical variable that no row will match
activities_out<-filter(merged_data,Activity_Label=="Output")
## for each unique combination of subject and activity create a subset
for (label in unique_labels){
  for (subject in unique_subject){
    working_subset_label<-filter(merged_data,Activity_Label==label & Subject_ID==subject)
    ## apply mean into subset
    loop_output<-lapply(working_subset_label,mean)
    ## rbind output onto dataframe
    activities_out<-rbind(activities_out,loop_output)
  } 
}

## rename columns in extracted data.frame
colnames(activities_out)[2]<-"Blank_Activity_Label"
colnames(activities_out)[1]<-"orig_activity_id"

## wrap activity_out table
wrapped_output<-tbl_df(activities_out)
## cut out extra 'activity label'
wrapped_out_cut<-tbl_df(select(activities_out,-Blank_Activity_Label))

## load activity labels in as table (this can be changed so that only ready in the activity labels once)
activity_labels_2nd<-read.table("UCI HAR Dataset/activity_labels.txt",col.names=c("activity_ID","Activity_Label_after_mean"),header=FALSE)
## merge with wrapped_out_cut
final_output_draft<-merge(activity_labels_2nd, wrapped_out_cut,by.x="activity_ID",by.y="orig_activity_id")
final_output<-tbl_df(final_output_draft)
final_output<-select(final_output,-activity_ID,-source)
final_output<-arrange(final_output, Subject_ID, Activity_Label_after_mean)

## remove working files
rm(X_vector,X_vector_train,activity_ID,activity_ID_train,col_names)
rm(col_index_vector,no_rows,num_vector)
rm(changed_names,orginal_features_names,features_file)
rm(features,filtered_col_names,subject_ID,subject_ID_train)
rm(clipped_test_output,clipped_train_output)
rm(activity_labels,combined_data)
rm(original, next_names, names_table)
rm(working_subset_label,label,subject,loop_output,variables_checked)
rm(activities_out,activity_labels_2nd,final_output_draft,merged_data,wrapped_out_cut,wrapped_output)
rm(unique_labels,unique_subject)

## write file to workspace - commented out as already run
## write.table(final_output,"final_output.txt",row.name=FALSE)