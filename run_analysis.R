## The following R script is structured into 5 main stages, as described in the README.MD file.
## Refer to Codebook.MD for any information regarding the data transformations and variables.

## 1. Merging the training and the test sets to create one individual data set

training_data <- read.table("train/X_train.txt")
testing_data <- read.table("test/X_test.txt")
x_data <- rbind(training_data, testing_data)

training_data <- read.table("train/subject_train.txt")
testing_data <- read.table("test/subject_test.txt")
subject_data <- rbind(training_data, testing_data)

training_data <- read.table("train/y_train.txt")
testing_data <- read.table("test/y_test.txt")
y_data <- rbind(training_data, testing_data)

## 2. Extracting only the measurements on the mean and standard deviation for each measurement

features <- read.table("features.txt")
mean_std_data <- grep("-mean\\(\\)|-std\\(\\)", features[, 2])
x_data <- x_data[, mean_std_data]
names(x_data) <- tolower(features[mean_std_data, 2])
names(x_data) <- gsub("\\(|\\)", "", names(x_data))

## 3. Using descriptive activity names to name the activities in the data set

names(y_data) <- "activities"
activities <- read.table("activity_labels.txt")
activities[, 2] = gsub("_", "-", tolower(as.character(activities[, 2])))
y_data[,1] = activities[y_data[,1],2]

## 4. Appropriately labeling the data set with descriptive activity names 

names(subject_data) <- "subject"
tidydata <- cbind(subject_data, y_data, x_data)

# Writing the first merged txt file into the working directory
write.table(tidydata, "tidydata_merged.txt", row.names=FALSE)

## 5. Creating a second, independent tidy data set with the average of each variable for each activity and each subject 

numActivities <- nrow(activities)
numCols <- dim(tidydata)[2]
uniqueSubjects <- unique(subject_data)[,1]
numSubjects <- length(uniqueSubjects)

data_results <- tidydata[1:(numSubjects*numActivities), ]

row = 1

for (s in 1:numSubjects) {
  for (a in 1:numActivities) {
    data_results[row, 1] = uniqueSubjects[s]
    data_results[row, 2] = activities[a, 2]
    temp <- tidydata[tidydata$subject==s & tidydata$activities==activities[a, 2], ]
    data_results[row, 3:numCols] <- colMeans(temp[, 3:numCols])
    row = row+1
  }
}

# Writing the second merged txt file (with averages) into the working directory
write.table(data_results, "tidydata_merged_avg.txt", row.names=FALSE)
