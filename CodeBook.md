 CODEBOOK - GETTING AND CLEANING DATA PROJECT
DESCRIPTION
* The purpose of this project is to demonstrate the ability to collect, work with, and clean a data set.
PROJECT GOAL
* The goal is to prepare tidy data that can be used for later analysis.
PROJECT OBJECTIVES
* Produce a tidy dataset
* A link to a Github repository with script for performing the analysis
* A code book (CodeBook.md) that
o Describes the variables
o The data
o Any transformations or work that was performed to clean up the data
* A README.md file that explains how all of the scripts work and how they are connected.

DEPENDENCIES
* DATA UCI HAR Dataset (Human Activity Recognition Using Smartphones Data Set Version 1.0)
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

1.The run_analysis script downloads  and   loads the data into R 
the following variables are used to create the test, train and subject data in R.
x_test
y_test 
subject_test
subject_set
2.we  extract  the mean  and standard deviation after loading  the activity_label.txt  and features.txt data into R.
The mean_std variable store the extracted mean and standard deviation.
3.In the activity data frame 
               4.I labeled  the measurement column with the appropriate name  
 

              5 I created a new tidy data
