# ---------- FINAL COURSE PROJECT - GETTING & CLEANING DATA ----------------- #
# 
# You should create one R script called run_analysis.R that does the following. 
# 
#       1. Merges the training and the test sets to create one data set.
# 
#       2. Extracts only the measurements on the mean and standard deviation for each measurement. 
# 
#       3. Uses descriptive activity names to name the activities in the data set
# 
#       4. Appropriately labels the data set with descriptive variable names. 
# 
#       5. From the data set in step 4, creates a second, 
#          independent tidy data set with the average of each variable for each activity and each subject.


# ------------------------------- SOLUTION SCRIPT ---------------------------- #
# Install required package if needed
if (!requireNamespace("dplyr", quietly = TRUE)) {
        install.packages("dplyr")
}

library(dplyr)

# Read metadata
features <- read.table("UCI HAR Dataset/features.txt")
activities <- read.table("UCI HAR Dataset/activity_labels.txt")

# Read train data
x_train <- read.table("UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")

# Read test data
x_test <- read.table("UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt")

# Merge train and test
x <- rbind(x_train, x_test)
y <- rbind(y_train, y_test)
subject <- rbind(subject_train, subject_test)

# Add variable names
names(x) <- features$V2

# Keep mean() and std()
keep <- grepl("mean\\(\\)|std\\(\\)", names(x))
x <- x[, keep]

# Combine
data <- cbind(subject, y, x)
names(data)[1:2] <- c("Subject", "Activity")

# Replace activity IDs with names
data$Activity <- factor(
        data$Activity,
        levels = activities$V1,
        labels = activities$V2
)

# Clean variable names
names(data) <- gsub("-", "", names(data))
names(data) <- gsub("\\(\\)", "", names(data))

# Create tidy dataset
tidyData <- data %>%
        group_by(Subject, Activity) %>%
        summarize(across(everything(), mean))

# Export
write.table(
        tidyData,
        "tidyData.txt",
        row.names = FALSE
)



















