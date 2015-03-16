## function to loop through variable names, check if contain mean or std and drop them if they don't
mean_drop<-function(data_table){
  print(class(data_table))
  working_file<-data_table
  ## print(ncol(data_table))
  no_cols<-ncol(data_table)
  for (column in 1:no_cols){
    ## print(column)
    col_name<-colnames(data_table)[column]
    ## print(col_name)
    print(class(col_name))
    ##check_in<-grepl("mean",col_name)
    ##print(check_in)
    ## checking to see if mean in the name
    if (!grepl("mean",col_name)){
      ## if does not contain mean check to see if contains "std"
      ##print("now check std")
      if (!grepl("std",col_name)){
        print("drop this column from working_file")
        
      }else{
        print("keep this variable - has std")
      }
    }else{
      print("keep this variable - has mean")
    }
    
  }
  return(working_file)
}