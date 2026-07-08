# gettingCleaningDataCourse
This repo is for the final course project of the JHU Getting and Cleaning Data course.


README
============================================================

Getting and Cleaning Data Course Project
Johns Hopkins University
Getting and Cleaning Data (Coursera)

============================================================
PROJECT OVERVIEW
============================================================

The purpose of this project is to demonstrate the ability to
collect, clean, and prepare data for analysis.

The dataset used in this project is the Human Activity Recognition
Using Smartphones Dataset obtained from the UCI Machine Learning
Repository.

The original data consist of accelerometer and gyroscope measurements
collected from Samsung Galaxy S smartphones while subjects performed
different physical activities.

The goal of the analysis is to create a tidy dataset containing the
average of selected measurements for each activity and each subject.

============================================================
FILES INCLUDED IN THIS REPOSITORY
============================================================

run_analysis.R

    Main R script used to process and clean the data.
    The script performs all required steps specified in
    the course project instructions.

------------------------------------------------------------

tidyData.txt

    Final tidy dataset produced by run_analysis.R.

    Contains the average of each selected measurement
    variable for each activity and each subject.

------------------------------------------------------------

CodeBook.txt

    Describes the variables contained in the tidy dataset.

    Includes details about the source data,
    transformations performed,
    variable definitions,
    and measurement naming conventions.

------------------------------------------------------------

README.txt

    Explains the contents of the repository and
    describes the analysis process.

============================================================
DATA SOURCE
============================================================

Human Activity Recognition Using Smartphones Dataset

Original dataset:

https://d396qusza40orc.cloudfront.net/getdata/projectfiles/UCI%20HAR%20Dataset.zip

Dataset description:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

============================================================
ANALYSIS PROCESS
============================================================

The script run_analysis.R performs the following operations:

STEP 1

Reads the source files from the UCI HAR Dataset:

    features.txt
    activity_labels.txt

    train/X_train.txt
    train/y_train.txt
    train/subject_train.txt

    test/X_test.txt
    test/y_test.txt
    test/subject_test.txt

------------------------------------------------------------

STEP 2

Merges the training and testing datasets into
one complete dataset.

------------------------------------------------------------

STEP 3

Assigns descriptive variable names using
the information contained in features.txt.

------------------------------------------------------------

STEP 4

Extracts only the variables related to:

    mean()
    std()

measurements.

Variables containing meanFreq() are excluded.

------------------------------------------------------------

STEP 5

Replaces numeric activity identifiers with
descriptive activity labels using
activity_labels.txt.

Activities include:

    WALKING
    WALKING_UPSTAIRS
    WALKING_DOWNSTAIRS
    SITTING
    STANDING
    LAYING

------------------------------------------------------------

STEP 6

Cleans variable names to improve readability
by removing special characters such as:

    ()
    -

------------------------------------------------------------

STEP 7

Creates a second independent tidy dataset
containing the average value of each
measurement variable for:

    each Subject
    each Activity

------------------------------------------------------------

STEP 8

Exports the resulting dataset to:

    tidyData.txt

============================================================
RESULTING DATASET
============================================================

The final tidy dataset contains:

    180 observations
    68 variables

The dataset consists of:

    30 subjects
    6 activities

resulting in:

    30 × 6 = 180 combinations

Each row represents one subject performing one activity.

Each measurement variable represents the average value
for that subject/activity combination.

============================================================
HOW TO RUN THE SCRIPT
============================================================

1. Download and extract the UCI HAR Dataset.

2. Place the folder:

       UCI HAR Dataset

   in the current R working directory.

3. Place run_analysis.R in the working directory.

4. Run:

       source("run_analysis.R")

5. The script will generate:

       tidyData.txt

============================================================
END OF README
============================================================

