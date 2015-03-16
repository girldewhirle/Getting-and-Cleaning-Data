## need to subset by activity type
unique_labels<-unique(merged_data$Activity_Label)
unique_subject<-unique(merged_data$Subject_ID)

activities_out<-filter(merged_data,Activity_Label=="Output")

for (label in unique_labels){
  ## print(label)
  
  for (subject in unique_subject){
    working_subset_label<-filter(merged_data,Activity_Label==label & Subject_ID==subject)
    variables_checked<-c(label,subject)
    ## print(variables_checked)
    loop_output<-lapply(working_subset_label,mean)
    
    activities_out<-rbind(activities_out,loop_output)
  } 
}

## remove files

rm(working_subset_label,label,subject,loop_output,variables_checked)

## rename columns

colnames(activities_out)[2]<-"Blank_Activity_Label"
colnames(activities_out)[1]<-"orig_activity_id"

## wrap activity_out table

wrapped_output<-tbl_df(activities_out)
wrapped_out_cut<-tbl_df(select(activities_out,-Blank_Activity_Label))

## load activity labels in as table

activity_labels_2nd<-read.table("UCI HAR Dataset/activity_labels.txt",col.names=c("activity_ID","Activity_Label_after_mean"),header=FALSE)

## merge with wrapped_out_cut

## final_output_draft<-merge(wrapped_out_cut,activity_labels_2nd,by.x="orig_activity_id",by.y="activity_ID")
final_output_draft<-merge(activity_labels_2nd, wrapped_out_cut,by.x="activity_ID",by.y="orig_activity_id")
final_output<-tbl_df(final_output_draft)
final_output<-select(final_output,-activity_ID,-source)
final_output<-arrange(final_output, Subject_ID, Activity_Label_after_mean)

## clean up working files
rm(activities_out,activity_labels_2nd,final_output_draft,merged_data,wrapped_out_cut,wrapped_output)
rm(unique_labels,unique_subject)