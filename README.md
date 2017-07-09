---
title: "README"
author: "Zelepukin Dmitriy"
date: '10 июля 2017 г '
output: html_document
---

#Getting and Cleaning Data course project

One of the most exciting areas in all of data science right now is wearable computing - see for example [this article](http://www.insideactivitytracking.com/data-science-activity-tracking-and-the-battle-for-the-worlds-top-sports-brand/). Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users.

In this project, data collected from the accelerometer and gyroscope of the Samsung Galaxy S smartphone was retrieved, worked with, and cleaned, to prepare a tidy data that can be used for later analysis.

This repository contains the following files:

- `README.md`  - an overview of the data.
- `tidy_data.txt` - the data set.
- `CodeBook.md` - the contents of the data and its transformations.
- `run_analysis.R` - the script used to create the `tidy_data.txt`  

## Study design 

The source data set that this project was based on was obtained from the [Human Activity Recognition Using Smartphones Data Set](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones#), which describes how the data was initially collected as follows:

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

### Attribute Information:

For each record in the dataset it is provided: 
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration. 
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.
 
The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.


## Creating the data set

The `run_analysis.R` used to create the data set. It retrieves the source data set and transforms it to produce the final data set by implementing the following steps (see the Code book for details, as well as the comments in the script itself):

- Download and unzip source data if it doesn't exist.
- Read data.
- Merge the training and the test sets to create one data set.
- Extract only the measurements on the mean and standard deviation for each measurement.
- Use descriptive activity names to name the activities in the data set.
- Appropriately label the data set with descriptive variable names.
- Create a second, independent tidy set with the average of each variable for each activity and each subject.
- Write the data set to the `tidy_data.txt` file.

R version R-3.4.1 for Windows 64-bit, Windows 10