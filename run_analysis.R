library(dplyr)

# let`s get data`
zUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
zFile <- "UCI HAR Dataset.zip"

if (!file.exists(zFile)) {
  download.file(zUrl, zFile, mode = "wb")
}

# extract file if doesn`t exist yet
dataPath <- "UCI HAR Dataset"
if (!file.exists(dataPath)) {
  unzip(zFile)
}

# load training
trainSubjects <- read.table(file.path(dataPath, "train", "subject_train.txt"))
trainValues <- read.table(file.path(dataPath, "train", "X_train.txt"))
trainActivity <- read.table(file.path(dataPath, "train", "y_train.txt"))

# load test data
testSubjects <- read.table(file.path(dataPath, "test", "subject_test.txt"))
testValues <- read.table(file.path(dataPath, "test", "X_test.txt"))
testActivity <- read.table(file.path(dataPath, "test", "y_test.txt"))

# extract features
features <- read.table(file.path(dataPath, "features.txt"), as.is = TRUE)

# extract activity labels
activities <- read.table(file.path(dataPath, "activity_labels.txt"))
colnames(activities) <- c("activityId", "activityLabel")


# merging
hactive <- rbind(
  cbind(trainSubjects, trainValues, trainActivity),
  cbind(testSubjects, testValues, testActivity)
)

# remove unusefull data
rm(trainSubjects, trainValues, trainActivity, 
   testSubjects, testValues, testActivity)

# add column names
colnames(hactive) <- c("subject", features[, 2], "activity")

# determine columns of data set to keep based on column name...
ctk <- grepl("subject|activity|mean|std", colnames(hactive))

# ... and keep data in these columns only
hactive <- hactive[, ctk]


# replace activity vals with named factor levels
hactive$activity <- factor(hactive$activity,levels = activities[, 1], labels = activities[, 2])


# get column names
hactiveCols <- colnames(hactive)

# remove special characters
hactiveCols <- gsub("[\\(\\)-]", "", hactiveCols)

# expand abbreviations and clean up names
hactiveCols <- gsub("^f", "frequencyDomain", hactiveCols)
hactiveCols <- gsub("^t", "timeDomain", hactiveCols)
hactiveCols <- gsub("Acc", "Accelerometer", hactiveCols)
hactiveCols <- gsub("Gyro", "Gyroscope", hactiveCols)
hactiveCols <- gsub("Mag", "Magnitude", hactiveCols)
hactiveCols <- gsub("Freq", "Frequency", hactiveCols)
hactiveCols <- gsub("mean", "Mean", hactiveCols)
hactiveCols <- gsub("std", "StandardDeviation", hactiveCols)

# correct typo
hactiveCols <- gsub("BodyBody", "Body", hactiveCols)

# use new labels as column names
colnames(hactive) <- hactiveCols


# group by subject and activity and summarise using mean
hactiveMeans <- hactive %>% 
  group_by(subject, activity) %>%
  summarise_each(funs(mean))

# output to file "tidy_data.txt"
write.table(hactiveMeans, "tidy_data.txt", row.names = FALSE, 
            quote = FALSE)