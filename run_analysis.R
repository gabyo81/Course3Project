 run_analysis <- function()
{
   x_test <- read.table("UCI HAR Dataset/test/x_test.txt", header = FALSE)
   y_test <- read.table("UCI HAR Dataset/test/y_test.txt", header = FALSE)
   features <- read.table("UCI HAR Dataset/features.txt" ,header = FALSE)
   subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt", header = FALSE)
   activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt", header = FALSE)
   activity_labels  <- rename(activity_labels,code = V1)
   activity_labels <- rename(activity_labels,label = V2)
   y_test <- rename(y_test,activity_code = V1)
   y_test_activity <- inner_join(activity_labels, y_test,c("code" = "activity_code"))
   y_test_activity <- mutate(y_test_activity,row_seq = row_number())
   required_measures <- grep("mean\\(\\)$|std\\(\\)$",features$V2)
   names(x_test) <- features$V2
   x_test_measures <- x_test[,required_measures]
   x_test_measures <-mutate (x_test_measures,row_seq = row_number() )
   x_test_measures <- inner_join(x_test_measures,y_test_activity)
   x_test_measures <- select(x_test_measures,-code)
   subject_test  <- mutate (subject_test,row_seq = row_number())
   x_test_measures <- inner_join(x_test_measures,subject_test)
   x_test_measures <- rename(x_test_measures,subject_id=V1)
   x_test_measures <- mutate(x_test_measures,source = "Test")
   
   
   x_train <- read.table("UCI HAR Dataset/train/X_train.txt", header = FALSE)
   y_train <- read.table("UCI HAR Dataset/train/Y_train.txt", header = FALSE)
   subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt", header = FALSE)
   y_train <- rename(y_train,activity_code = V1)
   y_train_activity <- inner_join(activity_labels, y_train,c("code" = "activity_code"))
   y_train_activity <- mutate(y_train_activity,row_seq = row_number())
   names(x_train) <- features$V2
   x_train_measures <- x_train[,required_measures]
   x_train_measures <-mutate (x_train_measures,row_seq = row_number() )
   x_train_measures <- inner_join(x_train_measures,y_train_activity)
   x_train_measures <- select(x_train_measures,-code)
   subject_train  <- mutate (subject_train,row_seq = row_number())
   x_train_measures <- inner_join(x_train_measures,subject_train)
   x_train_measures <- rename(x_train_measures,subject_id=V1)
   x_train_measures <- mutate(x_train_measures,source = "Train")
   
   full_x_df <- bind_rows(x_test_measures,x_train_measures)
   full_x_df <- rename(full_x_df,activity= label)
   
   full_x_df2 <- select(full_x_df,-source)
   final_dataset <- summarise_each(group_by(full_x_df2, activity, subject_id),funs(mean))
   final_dataset <- select(final_dataset,-row_seq)
   write.table(final_dataset,row.names = FALSE)
   final_dataset
   
  
  
}