CodeBook for the merged tidy datasets
=============================

Data source
-----------
- [Original source](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) 
- [Full description](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)


### Data Transformation Steps

Following data transformations are carried out by the `run_analysis.R` script.

1. For each of the training and test datasets, 
    1. Read the `X` values
    2. Take a subset of the columns representing only the mean and standard deviation values. Subsetting is done early on to conserve memory.
    3. Associate additional columns to represent activity IDs and subject IDs read from `y_<dataset>.txt` and `subject_<dataset>.txt` files respectively.
    4. Assign column names by manipulating the measurement names in `features.txt` to remove spaces and convert them to camel case.
2. Merge the training and the test sets, read as in step 1 to create one data set.
3. Associate an additional column with descriptive activity names as specified in `activity_labels.txt`.
4. Melt the dataset by specifying activity ID, name and subject ID as the only ID variables.
5. Re cast the melted dataset with activity name and subject id as the only IDs and `mean` as the aggregator function.
6. Save the result in re-casted dataset as `tidy.txt`


Feature Selection 
-----------------

