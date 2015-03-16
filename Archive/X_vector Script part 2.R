## wrap clipped files

wrapped_test_output<-tbl_df(clipped_test_output)
wrapped_train_output<-tbl_df(clipped_train_output)

## remove working files

## rm(clipped_test_output, clipped_train_output)

## add extra source column using mutate

wrapped_test_output<-mutate(wrapped_test_output, source="Test")
wrapped_train_output<-mutate(wrapped_train_output, source="Train")

## rbind the two data sets into one

combined_data<-rbind(wrapped_test_output, wrapped_train_output)