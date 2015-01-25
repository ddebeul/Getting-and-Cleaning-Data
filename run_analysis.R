# set correctly your work directory
setwd("/Users/ddebeul/Documents/Coursera/2. Getting and Cleaning Data/Project/UCI HAR Dataset")

# This is the run_analysis.R script - 5 points need to be donne :
# 1. Merges the training and the test sets to create one data set.
# 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
# 3. Uses descriptive activity names to name the activities in the data set
# 4. Appropriately labels the data set with descriptive variable names. 
# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

# 1. Merges the training and the test sets to create one data set.

X_merge <- rbind(read.table("train/X_train.txt"), read.table("test/X_test.txt"))
Y_merge <- rbind(read.table("train/y_train.txt"), read.table("test/y_test.txt"))
subject_merge <- rbind(read.table("train/subject_train.txt"), read.table("test/subject_test.txt"))

# 2. Extracts only the measurements on the mean and standard deviation for each measurement.

features <- read.table("features.txt")
Gfeatures <- grep("-mean\\(\\)|-std\\(\\)", features[, 2])
X_merge <- X_merge[, Gfeatures]
names(X_merge) <- features[Gfeatures, 2]
names(X_merge) <- gsub("\\(|\\)", "", names(X_merge))
names(X_merge) <- tolower(names(X_merge))

# 3. Uses descriptive activity names to name the activities in the data set.

activities <- read.table("activity_labels.txt")
activities[, 2] = gsub("_", "", tolower(as.character(activities[, 2])))
Y_merge[,1] = activities[Y_merge[,1], 2]
names(Y_merge) <- "activity"

# 4. Appropriately labels the data set with descriptive activity names.

names(subject_merge) <- "subject"
cleaned <- cbind(subject_merge, Y_merge, X_merge)
write.csv2(cleaned,file="merged_clean_data.csv")

# 5. Creates a 2nd, independent tidy data set with the average of each variable for each activity and each subject.

uniqueSubjects = unique(subject_merge)[,1]
numSubjects = length(unique(subject_merge)[,1])
numActivities = length(activities[,1])
numCols = dim(cleaned)[2]
result = cleaned[1:(numSubjects*numActivities), ]

row = 1
for (s in 1:numSubjects) {
        for (a in 1:numActivities) {
                result[row, 1] = uniqueSubjects[s]
                result[row, 2] = activities[a, 2]
                tmp <- cleaned[cleaned$subject==s & cleaned$activity==activities[a, 2], ]
                result[row, 3:numCols] <- colMeans(tmp[, 3:numCols])
                row = row+1
        }
}
write.csv2(result,file="average.csv")

