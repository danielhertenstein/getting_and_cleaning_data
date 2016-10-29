# Code Book for the Getting and Cleaning Data Course Project
## Contents
1. Description of the data
2. How to read tidy_data.txt
3. How tidy_data.txt was made

## 1. Description of the data
As described on the [Unverisy of California, Irvine website](https://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) the data is: "Human Activity Recognition database built from the recordings of 30 subjects performing activities of daily living (ADL) while carrying a waist-mounted smartphone with embedded inertial sensors." 

The website gives a further description of: "The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain."

This particular summarization of the data contains the average of each variable for each activity and each subject.

## 2. How to read tidy_data.txt
tidy_data.txt contains 15480 rows/observations and 4 columns/varibles/attributes describing the observations. Each observation corresponds to the average of a particluar variable for a particular activity and particular subject. The 4 columns are:
* subject_id
* activity_label
* feature
* mean

### subject_id
This variable identifies the subject who performed the activity. The variable is stored as an integer ranging from 1 to 30.

### activity_label
This variable identifies which of the six activities was performed. The variable is stored as a character vector. Possible values are:
* walking
* walking_upstairs
* walking_downstairs
* sitting
* standing
* laying

### feature
This variable identifies the feature that the observation represents. The features are the senor measurements reported by the device. The original data set has many features, and this data set contains all features from the original data set that relate to means or standard deviations of senor measurements. For a fuller description of the methods used to compute these variables, consult the [feature_info.txt](https://github.com/danielhertenstein/getting_and_cleaning_data/blob/master/UCI%20HAR%20Dataset/features_info.txt) in the raw data folder. The variable is stored as a factor with 86 levels. Possible values are:
* tBodyAcc-mean()-X: The mean of the acceleration of the body in the x-direction in the time domain 
* tBodyAcc-mean()-Y: The mean of the acceleration of the body in the y-direction in the time domain 
* tBodyAcc-mean()-Z: The mean of the acceleration of the body in the z-direction in the time domain 
* tBodyAcc-std()-X: The standard deviation of the acceleration of the body in the x-direction in the time domain
* tBodyAcc-std()-Y: The standard deviation of the acceleration of the body in the y-direction in the time domain
* tBodyAcc-std()-Z: The standard deviation of the acceleration of the body in the z-direction in the time domain
* tGravityAcc-mean()-X: The mean of the acceleration of gravity in the x-direction in the time domain 
* tGravityAcc-mean()-Y: The mean of the acceleration of gravity in the y-direction in the time domain 
* tGravityAcc-mean()-Z: The mean of the acceleration of gravity in the z-direction in the time domain 
* tGravityAcc-std()-X: The standard deviation of the acceleration of gravity in the x-direction in the time domain
* tGravityAcc-std()-Y: The standard deviation of the acceleration of gravity in the x-direction in the time domain
* tGravityAcc-std()-Z: The standard deviation of the acceleration of gravity in the x-direction in the time domain
* tBodyAccJerk-mean()-X: The mean of the jerk of the body in the x-direction in the time domain 
* tBodyAccJerk-mean()-Y: The mean of the jerk of the body in the y-direction in the time domain 
* tBodyAccJerk-mean()-Z: The mean of the jerk of the body in the z-direction in the time domain 
* tBodyAccJerk-std()-X: The standard deviation of the jerk of the body in the x-direction in the time domain 
* tBodyAccJerk-std()-Y: The standard deviation of the jerk of the body in the y-direction in the time domain 
* tBodyAccJerk-std()-Z: The standard deviation of the jerk of the body in the z-direction in the time domain 
* tBodyGyro-mean()-X: The mean of the gyroscope signal in the x-direction in the time domain 
* tBodyGyro-mean()-Y: The mean of the gyroscope signal in the y-direction in the time domain 
* tBodyGyro-mean()-Z: The mean of the gyroscope signal in the z-direction in the time domain 
* tBodyGyro-std()-X: The standard deviation of the gyroscope signal in the x-direction in the time domain 
* tBodyGyro-std()-Y: The standard deviation of the gyroscope signal in the y-direction in the time domain 
* tBodyGyro-std()-Z: The standard deviation of the gyroscope signal in the z-direction in the time domain 
* tBodyGyroJerk-mean()-X: The mean of the gyroscope jerk signal in the x-direction in the time domain 
* tBodyGyroJerk-mean()-Y: The mean of the gyroscope jerk signal in the y-direction in the time domain 
* tBodyGyroJerk-mean()-Z: The mean of the gyroscope jerk signal in the z-direction in the time domain 
* tBodyGyroJerk-std()-X: The standard deviation of the gyroscope jerk signal in the x-direction in the time domain 
* tBodyGyroJerk-std()-Y: The standard deviation of the gyroscope jerk signal in the y-direction in the time domain 
* tBodyGyroJerk-std()-Z: The standard deviation of the gyroscope jerk signal in the z-direction in the time domain 
* tBodyAccMag-mean(): The mean of the magnitude of the body acceleration in the time domain 
* tBodyAccMag-std(): The standard deviation of the magnitude of the body acceleration in the time domain 
* tGravityAccMag-mean(): The mean of the magnitude of the acceleration of gravity in the time domain 
* tGravityAccMag-std(): The standard deviation of the magnitude of the acceleration of gravity in the time domain 
* tBodyAccJerkMag-mean(): The mean of the magnitude of the jerk acceleration of the body in the time domain 
* tBodyAccJerkMag-std(): The standard deviation of the magnitude of the jerk acceleration of the body in the time domain 
* tBodyGyroMag-mean(): The mean of the magnitude of the gyroscope signal in the time domain 
* tBodyGyroMag-std(): The standard deviation of the magnitude of the gyroscope signal in the time domain 
* tBodyGyroJerkMag-mean(): The mean of the magnitude of the gyroscope jerk signal in the time domain 
* tBodyGyroJerkMag-std(): The standard deviation of the magnitude of the gyroscope jerk signal in the time domain 
* fBodyAcc-mean()-X: The mean of the acceleration of the body in the x-direction in the frequency domain 
* fBodyAcc-mean()-Y: The mean of the acceleration of the body in the y-direction in the frequency domain 
* fBodyAcc-mean()-Z: The mean of the acceleration of the body in the z-direction in the frequency domain 
* fBodyAcc-std()-X: The standard deviation of the acceleration of the body in the x-direction in the frequency domain
* fBodyAcc-std()-Y: The standard deviation of the acceleration of the body in the y-direction in the frequency domain
* fBodyAcc-std()-Z: The standard deviation of the acceleration of the body in the z-direction in the frequency domain
* fBodyAcc-meanFreq()-X: The mean frequency of the body acceleration in the x-direction in the frequency domain
* fBodyAcc-meanFreq()-Y: The mean frequency of the body acceleration in the y-direction in the frequency domain
* fBodyAcc-meanFreq()-Z: The mean frequency of the body acceleration in the z-direction in the frequency domain
* fBodyAccJerk-mean()-X: The mean of the jerk of the body in the x-direction in the frequency domain 
* fBodyAccJerk-mean()-Y: The mean of the jerk of the body in the y-direction in the frequency domain 
* fBodyAccJerk-mean()-Z: The mean of the jerk of the body in the z-direction in the frequency domain 
* fBodyAccJerk-std()-X: The standard deviation of the jerk of the body in the x-direction in the frequency domain 
* fBodyAccJerk-std()-Y: The standard deviation of the jerk of the body in the y-direction in the frequency domain 
* fBodyAccJerk-std()-Z: The standard deviation of the jerk of the body in the z-direction in the frequency domain 
* fBodyAccJerk-meanFreq()-X: The mean frequency of the body jerk acceleration in the x-direction in the frequency domain
* fBodyAccJerk-meanFreq()-Y: The mean frequency of the body jerk acceleration in the y-direction in the frequency domain
* fBodyAccJerk-meanFreq()-Z: The mean frequency of the body jerk acceleration in the z-direction in the frequency domain
* fBodyGyro-mean()-X: The mean of the gyroscope signal in the x-direction in the frequency domain
* fBodyGyro-mean()-Y: The mean of the gyroscope signal in the y-direction in the frequency domain
* fBodyGyro-mean()-Z: The mean of the gyroscope signal in the z-direction in the frequency domain
* fBodyGyro-std()-X: The standard deviation of the gyroscope signal in the x-direction in the frequency domain
* fBodyGyro-std()-Y: The standard deviation of the gyroscope signal in the y-direction in the frequency domain
* fBodyGyro-std()-Z: The standard deviation of the gyroscope signal in the z-direction in the frequency domain
* fBodyGyro-meanFreq()-X: The mean frequency of the gyroscope signal in the x-direction in the frequency domain
* fBodyGyro-meanFreq()-Y: The mean frequency of the gyroscope signal in the y-direction in the frequency domain
* fBodyGyro-meanFreq()-Z: The mean frequency of the gyroscope signal in the z-direction in the frequency domain
* fBodyAccMag-mean(): The mean of the magnitude of the body acceleration in the frequency domain
* fBodyAccMag-std(): The standard deviation of the magnitude of the body acceleration in the frequency domain
* fBodyAccMag-meanFreq(): The mean frequency of the magnitude of the body acceleration in the frequency domain
* fBodyBodyAccJerkMag-mean(): The mean of the magnitude of the jerk acceleration of the body in the frequency domain
* fBodyBodyAccJerkMag-std(): The standard deviation of the magnitude of the jerk acceleration of the body in the frequency domain
* fBodyBodyAccJerkMag-meanFreq(): The mean frequency of the magnitude of the jerk acceleration of the body in the frequency domain
* fBodyBodyGyroMag-mean(): The mean of the magnitude of the gyroscope signal in the frequency domain
* fBodyBodyGyroMag-std(): The standard deviation of the magnitude of the gyroscope signal in the frequency domain
* fBodyBodyGyroMag-meanFreq(): The mean frequency of the magnitude of the gyroscope signal in the frequency domain
* fBodyBodyGyroJerkMag-mean(): The mean of the magnitude of the gyroscope jerk signal in the frequency domain
* fBodyBodyGyroJerkMag-std(): The standard deviation of the magnitude of the gyroscope jerk signal in the frequency domain
* fBodyBodyGyroJerkMag-meanFreq(): The mean frequency of the magnitude of the gyroscope jerk signal in the frequency domain
* angle(tBodyAccMean,gravity): The angle between the mean of the body acceleration in the time domain and gravity
* angle(tBodyAccJerkMean),gravityMean): The angle between the mean of the body jerk acceleration in the time domain and mean of gravity
* angle(tBodyGyroMean,gravityMean): The angle between the mean of the gyroscope signal in the time domain and mean of gravity
* angle(tBodyGyroJerkMean,gravityMean): The angle between the mean of the gyroscope jerk signal in the time domain and mean of gravity
* angle(X,gravityMean): The angle between the x-direction and the mean of gravity
* angle(Y,gravityMean): The angle between the x-direction and the mean of gravity
* angle(Z,gravityMean): The angle between the x-direction and the mean of gravity

### mean
This variable is the mean of all observations in the raw data set for the subject, activity, and feature listed in the other columns of the particular row. This variable is stored as a numeric. Possible values for this variable range from [-1, 1].

## 3. How tidy_data.txt was made
This section gives walkthrough of the methods used in the run_analysis.R script to go from the raw data to the tidy_data.txt file located in the repository.

The raw data files used were:
* features.txt
* activity_labels.txt
* train/subject_train.txt
* train/X_train.txt
* train/y_train.txt
* test/subject_test.txt
* test/X_test.txt
* test/y_test.txt

The R libraries used were:
* reshape2
* data.table
* plyr
* tidyr
* dplyr

After reading all of the data files into R, I first took the feature names listed in the features.txt file and applied them to the variable names in the X_train.txt and X_test.txt data. This was done so that the values in the feature column (which was later to come) would be properly desciptive, ensuring a tidy data set and fulfilling a portion of the requirements in Step 4 of the assignment.

I then mapped the numeric values in the y_train.txt and y_test.txt data to the corresponding activity labels in the activity_labels.txt file, and added this data to the X_train.txt and X_test.txt data. This allowed the data to be later grouped by activity. The numeric values were mapped to the activity labels to make the variable easier to understand, ensure a tidy data set, and fulfill Step 3 of the assignment.

After this I added the subject ids from the subject_train.txt and subject_test.txt data to the X_train.txt and X_test.txt data in the form of a new column so that the data could be later grouped by subject id.

At this point I combined the X_train.txt and Y_train.txt data into a new data table fulfilling Step 1 of the assignment. I waited until this point to combine the train and test data to make combining the observation data, subject id data, and activity label data of each group easier.

With the data fully combined, I then extracted only the measurements on the mean and standard deviation for each measurement from my data table and, besides the subject ids and activity labels, dropped all other columns. Because the instructions online were not entirely clear, I chose to keep the angle measurements that involved means of other measurements. This new data set fulfills the requirements of Step 2 of the assignment.

To fulfill Step 5 of the assignment, I grouped the new data set by subject id and activity label and computed the means of all of the extracted feature groups. This produced a data table with a column for the subject id, a column for the activity label, and a separate column for each measurment. The values in the measurement columns were the means for that particular measurement. To make the data set tidier, I reshaped the data table such that the measurement columns became a single column of factors, and I moved the means into their own column. As a result, row contained its own observation, one of the three aspects of tidy data as recommended by [Hadley Wickham](http://vita.had.co.nz/papers/tidy-data.pdf).