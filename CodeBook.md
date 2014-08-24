CodeBook for the merged tidy datasets
=====================================

Data source
-----------
- [Original source](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) 
- [Full description](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)


## Original Data Set Information:

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. 


Data Transformation Steps
-------------------------

The `run_analysis.R` script performs the following data transformations:

1. Merges the training and the test sets to create one data set (`tidydata_merged.txt`)
    - train/X_train.txt with test/X_test.txt -> the result is a 10299 x 561 data frame
    - train/subject_train.txt with test/subject_test.txt -> the result is a 10299 x 1 data frame with subject IDs
    - train/y_train.txt with test/y_test.txt -> the result is another 10299 x 1 data frame with activity IDs.
2. Extracts only the measurements on the mean and standard deviation for each measurement
    - The result is a 10299 x 66 data frame -> 66 out of 561 attributes are measurements on the mean and standard deviation.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names
    - All features and activity names are converted to lower case, underscores and brackets are removed
5. Creates a second, independent tidy data set (`tidydata_merged_avg.txt`) with the average of each variable for each activity and each subject. 


Variables and files data descriptions 
-------------------------------

### `tidydata_merged.txt`
This is a 10299x68 data frame. The first column contains subject IDs, the second column activity names, and the last 66 columns are measurements.

### `tidydata_merged_avg.txt`
This is a 180x68 data frame. As in `tidydata_merged.txt`, the first column contains subject IDs and the second column contains the activity names. The avg measurements for each of the 66 attributes are in columns 3:68. There are 30 subjects and 6 activities for a total of 180 rows with measurements.

## Fields and measurements
* subject: Test subject ID
* activity: Activity name (see below)

The following fields are inherited by the original data source. Please refer to the source url for additional informations if needed:
* tbodyacc-mean-x
* tbodyacc-mean-y
* tbodyacc-mean-z
* tbodyacc-std-x
* tbodyacc-std-y
* tbodyacc-std-z
* tgravityacc-mean-x
* tgravityacc-mean-y
* tgravityacc-mean-z
* tgravityacc-std-x
* tgravityacc-std-y
* tgravityacc-std-z
* tbodyaccjerk-mean-x
* tbodyaccjerk-mean-y
* tbodyaccjerk-mean-z
* tbodyaccjerk-std-x
* tbodyaccjerk-std-y
* tbodyaccjerk-std-z
* tbodygyro-mean-x
* tbodygyro-mean-y
* tbodygyro-mean-z
* tbodygyro-std-x
* tbodygyro-std-y
* tbodygyro-std-z
* tbodygyrojerk-mean-x
* tbodygyrojerk-mean-y
* tbodygyrojerk-mean-z
* tbodygyrojerk-std-x
* tbodygyrojerk-std-y
* tbodygyrojerk-std-z
* tbodyaccmag-mean
* tbodyaccmag-std
* tgravityaccmag-mean
* tgravityaccmag-std
* tbodyaccjerkmag-mean
* tbodyaccjerkmag-std
* tbodygyromag-mean
* tbodygyromag-std
* tbodygyrojerkmag-mean
* tbodygyrojerkmag-std
* fbodyacc-mean-x
* fbodyacc-mean-y
* fbodyacc-mean-z
* fbodyacc-std-x
* fbodyacc-std-y
* fbodyacc-std-z
* fbodyaccjerk-mean-x
* fbodyaccjerk-mean-y
* fbodyaccjerk-mean-z
* fbodyaccjerk-std-x
* fbodyaccjerk-std-y
* fbodyaccjerk-std-z
* fbodygyro-mean-x
* fbodygyro-mean-y
* fbodygyro-mean-z
* fbodygyro-std-x
* fbodygyro-std-y
* fbodygyro-std-z
* fbodyaccmag-mean
* fbodyaccmag-std
* fbodybodyaccjerkmag-mean
* fbodybodyaccjerkmag-std
* fbodybodygyromag-mean
* fbodybodygyromag-std
* fbodybodygyrojerkmag-mean
* fbodybodygyrojerkmag-std

##Activities

1. Walking
2. Walking upstairs
3. Walking downstairs
4. Sitting
5. Standing
6. Laying
