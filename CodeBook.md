---
title: "Code Book"
output: html_document
---

This file indicates all the variables and summaries I calculated, along with units, and any other relevant information.

##Input

The data used on this script can be found [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip).

The data is on a folder called UCI HAR Dataset, we will only need the following files:

* activity_labels.txt
* features.txt
* subject_test.txt
* subject_train.txt
* X_test.txt
* X_train.txt
* y_test.txt
* y_train.txt

For convenient, you need to set the UCI HAR Dataset on your R working directory.

##Output

Two datasets are generated, the first one (CleanData.csv) appropriately labels the data set with descriptive activity name. The second one (Average.csv) creates a tidy data set with the average of each variable for each activity and each subject. The datasets will be saved on your working directory.

####Files informations

**1. CleanData.csv**

This dataset does not add features, but only creates a subset and merges two datasets into one.

1. subject (row) : An identifier number of the subject who carried out the experiment
2. activity (row): An identifier of the activity performed by the subject (see below)
3. The names of the attributes (col) (see below).

**Activity are related this way:**

* WALKING
* WALKING_UPSTAIRS
* WALKING_DOWNSTAIRS
* SITTING
* STANDING
* LAYING

**Attributes names :**

* tbodyacc-mean-x 
* tbodyacc-mean-y 
* tbodyacc-mean-z 
* tbodyacc-std-x 
* tbodyacc-std-y 
* tbodyacc-std-z
* tgravityacc-mean-x 
* tgravityacc-mean-y

The original dataset only includes the activitycode and puts the description on another file. The run_analysis.R script gets the description and merges it with their corresponding code so the dataset is easier to understand.

**2. Average.csv**

This dataset gets the mean for the data of each activities and attributes. The definition of the rows and columns are the same as for the CleanData.csv file. 

## Variables

Description of the variables :

* X_merge 
* Y_merge 
* subject_merge

These variables contain the merged data from the training & test sets

* features : contains the features from the features.txt
* activities : contains the activities from the activities_labels.txt
* cleaned : contain the data with the appropriately labes 
* result : contain the men of the data for each activities and attributes




