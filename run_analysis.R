# Coursera Data Science Specialization - Getting and Cleaning Data
# Course Project - May 24, 2015


# The following script reads in the Samsung data set from the user's working
# directory, cleans the data, and then writes the tidy data set to a .txt file.


# Require R packages needed for analysis.
library(magrittr); library(plyr); library(dplyr); library(reshape2);
library(lubridate); library(digest)

setwd('~/DataScienceSpecialization-Coursera/3-GettingAndCleaningData/Week3/CourseProject_data/UCI HAR Dataset')

# Read in the 561-feature vector for the training set
trainDat_values <- read.table('train/X_train.txt')

# Read in the training data activity labels for each record
trainDat_labels <- read.table('train/y_train.txt')

# Read in the subject labels for each record in the training set
trainDat_subjects <- read.table('train/subject_train.txt')

# Read in the 561-feature vector for the test set
testDat_values <- read.table('test/X_test.txt')

# Read in the test data activity labels for each record
testDat_labels <- read.table('test/y_test.txt')

# Read in the subject labels for each record in the test set
testDat_subjects <- read.table('test/subject_test.txt')

# Read in the variable names for the data
Dat_names <- read.table('features.txt')


# Combine the training data into one data frame
colnames(trainDat_values) <- as.character(Dat_names$V2)
trainDat <- cbind(trainDat_subjects, trainDat_labels, trainDat_values)
colnames(trainDat) <- c("Subject", "Activity", colnames(trainDat_values))

# Insert a column into 'trainDat' identifying the data frame as training data.
trainDat$DataGroup <- "Training"

# Combine the test data into one data frame
colnames(testDat_values) <- as.character(Dat_names$V2)
testDat <- cbind(testDat_subjects, testDat_labels, testDat_values)
colnames(testDat) <- c("Subject", "Activity", colnames(testDat_values))

# Insert a column into 'testDat' identifying the data frame as test data.
testDat$DataGroup <- "Test"

# Row bind 'trainDat' with 'testDat' to collect all data in one df.
fullDat <- rbind(trainDat, testDat)

# 'activity_labels.txt' file defines mapping from numbers to labels for
# the 6 different activities.
# 1 = Walking
# 2 = WalkingUpstairs
# 3 = WalkingDownstairs
# 4 = Sitting
# 5 = Standing 
# 6 = Laying

# Assign these text labels to their corresponding integer value in column 
# 'Activity'
fullDat$Activity <- gsub('1', 'Walking', fullDat$Activity, fixed=TRUE)
fullDat$Activity <- gsub('2', 'WalkingUpstairs', fullDat$Activity, fixed=TRUE)
fullDat$Activity <- gsub('3', 'WalkingDownstairs', fullDat$Activity, fixed=TRUE)
fullDat$Activity <- gsub('4', 'Sitting', fullDat$Activity, fixed=TRUE)
fullDat$Activity <- gsub('5', 'Standing', fullDat$Activity, fixed=TRUE)
fullDat$Activity <- gsub('6', 'Laying', fullDat$Activity, fixed=TRUE)

# Extract only the measurements on the mean and standard deviation for each 
# measurement. 
meanOrStd_chr <- c("mean()", "std()", "Mean", "meanFreq()")
colIndices <- integer()
for (i in 1:length(meanOrStd_chr)) {
    colIndices <- c(colIndices, grep(meanOrStd_chr[i], colnames(fullDat), 
                                     value=FALSE, fixed=TRUE))
}
colIndices <- sort(colIndices)

subsetDat <- fullDat[, c(1, 2, colIndices, 564)]

# Remove "-", "(", and ")" from the colnames of 'subsetDat'
colnames(subsetDat) <- gsub("-", "", colnames(subsetDat), fixed=TRUE)
colnames(subsetDat) <- gsub("(", "", colnames(subsetDat), fixed=TRUE)
colnames(subsetDat) <- gsub(")", "", colnames(subsetDat), fixed=TRUE)
colnames(subsetDat) <- gsub(",", "", colnames(subsetDat), fixed=TRUE)

# From 'subsetDat', create a second, independent tidy data set 
# with the average of each variable for each activity and each subject.
colNamesDat <- plyr::as.quoted(colnames(subsetDat)[4:88])
summaryDat <- ddply(subsetDat, .(Subject, Activity), summarize, 
                    Avg=mean(tBodyAccmeanX))
tempDat <- data.frame()
for (i in colNamesDat) {
    tempDat <- subsetDat %>%
        ddply(.(Subject, Activity), summarize, Avg=mean(i)) 
    summaryDat <- cbind(summaryDat, tempDat)
}

# Remove all duplicate columns from 'summaryDat'
# sumDat <- summaryDat[!duplicated(lapply(summaryDat, digest))]
subjCols <- grep("Subject", colnames(summaryDat), value=FALSE, fixed=TRUE)
subjCols <- subjCols[2:length(subjCols)]
actCols <- grep("Activity", colnames(summaryDat), value=FALSE, fixed=TRUE)
actCols <- actCols[2:length(actCols)]
duplicateCols <- c(subjCols, actCols)
duplicateCols <- sort(duplicateCols)

sumDat <- summaryDat[, -duplicateCols]
colnames(sumDat) <- c("Subject", "Activity", "tBodyAccmeanX", colnames(subsetDat)[4:88])

# Write to .txt file.
# setwd('~/DataScienceSpecialization-Coursera/3-GettingAndCleaningData/Week3/CourseProject')
write.table(x=sumDat, file='samsungTidyData.txt', quote=FALSE, row.names=FALSE)

