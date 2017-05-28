# Code Book
The list of variables listed in the tidyDataSet.txt files are the following:
*activity   
*subject_id
*tBodyAccMag.mean
*tBodyAccMag.std
*tGravityAccMag.mean
*tGravityAccMag.std
*tBodyAccJerkMag.mean
*tBodyAccJerkMag.std
*tBodyGyroMag.mean
*tBodyGyroMag.std
*tBodyGyroJerkMag.mean
*tBodyGyroJerkMag.std
*fBodyAccMag.mean
*fBodyAccMag.std
*fBodyBodyAccJerkMag.mean
*fBodyBodyAccJerkMag.std
*fBodyBodyGyroMag.mean
*fBodyBodyGyroMag.std
*fBodyBodyGyroJerkMag.mean
*fBodyBodyGyroJerkMag.std

# Variables in the run_analysis.R file

* **x_test** : Holds the orginal data of the file x_test.txt in the data of the URL. Data of observations per subject, it has all of the measurements in columns. For a complete list of measurements you can look at the content of the variable features

* **y_test** : Holds the orginal data of the file y_test.txt in the data of the URL. Data of of activities done, this table can relate with the activity_labels variable
 
* **subject_test**: Holds the orginal data of the file subject_test.txt in the data of the URL. This variable holds all of the subjects ids that relates to each obversation in the x_test variable

* **features** : Holds the original data of the file features.txt in the data of the URL.

* **activity_labels** : Holds the orginal data of the file activity_labels.txt in the data of the URL.
the values included here are

Code | Label
---- | -----
1 | WALKING
2 | WALKING_UPSTAIRS
3 | WALKING_DOWNSTAIRS
4 | SITTING
5 | STANDING
6 | LAYING

* **y_test_activity** : This variable joins the two variables y_test and activity_labels

* **required_measures** : This varible extracts only the names of the measurements of  means and standard deviation of the measurements included in x_test.

* **x_test_measures** : This variable extracts the means and standard deviation of the x_test variable using the required_measures variable.

* **x_train** : Holds the original data of the file x_train.txt in the data of the URL

* **y_train** : Holds the original data of the file y_train.txt in the data of the URL

* **subject_train** : Holds the original data of the file subject_train.txt in the data of the URL

* **y_train_activity** : Joins the two tables from the variables y_train and activity_labels

* **x_train_measures** : This variables extracts the means and standard deviation of the x_train using the required_measures variable

* **full_x_df** : variable that unions the 2 variables x_train_measures and x_test_measures

* **full_x_df2** : This variables stores the data of the full_x_df without the source column that keeps track of where the data came from.

* **final_dataset** : This is the final data set that is also stored in the file tidyDataSet.txt
