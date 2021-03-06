# I think that I need these libraries
library(reshape2)
library(data.table)
library(plyr)
library(tidyr)
library(dplyr)

# Check to see if the UCI HAR Dataset is in the working directory. If not, download it.
if (!dir.exists('UCI HAR Dataset')) {
  download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", "UCI HAR Dataset.zip")
  unzip('UCI HAR Dataset.zip')
}

# Read in the data that applies to both the train and test data sets
features <- read.table('UCI HAR Dataset/features.txt')

# Read in the train data
train_subject <- read.table('UCI HAR Dataset/train/subject_train.txt')
train_x <- read.table('UCI HAR Dataset/train/X_train.txt')
train_y <- read.table('UCI HAR Dataset/train/y_train.txt')

# Read in the test data
test_subject <- read.table('UCI HAR Dataset/test/subject_test.txt')
test_x <- read.table('UCI HAR Dataset/test/X_test.txt')
test_y <- read.table('UCI HAR Dataset/test/Y_test.txt')

# Set the dataset column names to be the values in the list of features
# This is Step 4: "Appropriately label the data set with descriptive variable names"
names(train_x) <- features$V2
names(test_x) <- features$V2

# We don't need the feature data anymore, so release that memory
rm('features')

# Set the column name of the labels data sets (train_y and test_y) to "activity_label" to provide more description
names(train_y) <- c("activity_label")
names(test_y) <- c("activity_label")

# Map the activity labels in 'activity_labels.txt' to the numeric values in the label data sets (train_y and test_y)
train_y$activity_label <- mapvalues(train_y$activity_label, 
                                    from = c(1, 2, 3, 4, 5, 6), 
                                    to = c("walking", "walking_upstairs", "walking_downstairs", "sitting", "standing", "laying"))
test_y$activity_label <- mapvalues(test_y$activity_label, 
                                   from = c(1, 2, 3, 4, 5, 6), 
                                   to = c("walking", "walking_upstairs", "walking_downstairs", "sitting", "standing", "laying"))

# Add the activity label data to the feature vector data
# This is Step 3: "Uses descriptive activity names to name the activities in the data set"
train_x$activity_label <- train_y$activity_label
test_x$activity_label <- test_y$activity_label

# We don't need the train_y or test_y files now that the data is in the train_x and test_x files, so release that memory
rm('train_y')
rm('test_y')

# Set the column name of the subject data sets (train_subject and test_subject) to "subject_id" to provide more description
names(train_subject) <- c("subject_id")
names(test_subject) <- c("subject_id")

# Add the subject id data to the feature vector data
train_x$subject_id <- train_subject$subject_id
test_x$subject_id <- test_subject$subject_id

# We don't need the train_subject or test_subject data sets now that the data is in the train_x and test_x files, so release that memory
rm('train_subject')
rm('test_subject')

# "Merges the training and test sets to create one data set" (Step 1)
activity_data <- rbind(train_x, test_x)

# We don't need the train_x or test_x data sets now that we've combined them into activity_data, so release that memory
rm('train_x')
rm('test_x')

# "Extracts only the measurements on the mean and standard deviation for each measurement" (Step 2)
columns_i_want <- grep("[Mm]ean|std|dataset|activity_label|subject_id", names(activity_data))
activity_data <- activity_data[, columns_i_want]
rm('columns_i_want')

# Create a new data set that contains the means of the extracted features grouped by subject and activity (Step 5: First part)
tidy_data <- aggregate(activity_data[,1:86], 
                       by = list(subject_id = activity_data$subject_id, activity_label = activity_data$activity_label), 
                       FUN = mean)

# We don't need the activity_data dataframe anymore, so let's release that memory
rm('activity_data')

# Makes the data set narrow and tidy (Finishes Step 5)
tidy_data <- melt(tidy_data, id = c("subject_id", "activity_label"), variable.name = "feature", value.name = "mean")
write.table(tidy_data, "tidy_data.txt")