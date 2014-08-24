# Getting and Cleaning Data

Data source: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

Full description: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

## Course Project

The R script created for this assignment is called run_analysis.R and does the following operations:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive activity names.
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## How to run the script and generate the merged data sets

1. Download the data source. You'll then have a ```UCI HAR Dataset``` folder.
2. Place the script ```run_analysis.R``` in the parent folder of ```UCI HAR Dataset```. 
3. Set ```UCI HAR Dataset``` as your working directory using the ```setwd()``` function in RStudio.
4. Run ```source("run_analysis.R")```, then it will generate the merged data file ```tidydata_merged_avg.txt``` in your working directory.
