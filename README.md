# README for Getting and Cleaning Data Course Project
## Files included:
* README.md (This file)
* tidy_data.txt - The tidy data set with the average of each variable for each activity and each subject.
* run_analysis.R - The R script used to create the tidy data set from the source files.
* CodeBook.md - The code book describing the structure of the tidy data set and the process used to create it.
* UCI HAR Dataset - The raw data used to create the tidy data set.

## Viewing the tidy data set
As can be seen on line 90 of run_analysis.R, the data set was saved with the code:
```R
write.table(tidy_data, "tidy_data.txt")
```
The data set can be read into R with the command:
```R
tidy_data <- read.table("tidy_data.txt")
```

## Using the analysis script
The R script, [run_analysis.R](https://github.com/danielhertenstein/getting_and_cleaning_data/blob/master/run_analysis.R), is meant to be run in the same working directory as the UCI HAR Dataset, and can be executed with the command:
```R
source("run_analysis.R")
```
The following libraries are used in the script and should be installed prior to running the script:
* reshape2
* data.table
* plyr
* tidyr
* dplyr
These libraries can be installed with the command:
```R
install.packages("[package_name]")
```
If the UCI HAR Dataset is not in the current working directory, the run_analysis.R script will download the zip file from the coursera website and extract it into the current working directory.

run_analysis.R will save the tidy data set to the current working directory with the name: tidy_data.txt.

## The code book
[CodeBook.md](https://github.com/danielhertenstein/getting_and_cleaning_data/blob/master/CodeBook.md) describes the variables in tidy_data.txt, the data used to create tidy_data.txt, and the transformations and work performed to clean up the data along the way.

## The raw data
The UCI HAR Dataset is a public data set hosted by the University of California, Irvine containing human activity recognition data from a study in 2012. As the data set is included in the repository, I will point you to the data set's [readme](https://github.com/danielhertenstein/getting_and_cleaning_data/blob/master/UCI%20HAR%20Dataset/README.txt) for a fuller description. The data set is hosted [here](https://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).