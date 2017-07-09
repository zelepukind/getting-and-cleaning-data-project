---
title: "Project"
author: "Zelepukin Dmitriy"
date: '10 июля 2017 г '
output: html_document
---

# Getting and Cleaning Data course project

data source - `tidy_data.txt` (file downloaded - UCI HAR Dataset). It is a text file with space as separator.

More information on set is in `README.md`


## Variables <a name="variables"></a>

Each row contains 79 averaged signal measurements  on a special given subject and activity as columns.

### Identifiers 

- `subject`

	Subject identifier, integer, ranges from 1 to 30.

- `activity`

	Activity identifier, string with 6 possible values: 
	- `WALKING`: subject was walking
	- `WALKING_UPSTAIRS`: subject was walking upstairs
	- `WALKING_DOWNSTAIRS`: subject was walking downstairs
	- `SITTING`: subject was sitting
	- `STANDING`: subject was standing
	- `LAYING`: subject was laying

### Average of measurements <a name="average-measurements"></a>

All measurements are floating-point values, normalised and bounded within [-1,1].

Prior to normalisation, acceleration measurements (variables containing `Accelerometer`) were made in *g*'s (9.81 m.s⁻²) and gyroscope measurements (variables containing `Gyroscope`) were made in radians per second (rad.s⁻¹).

Magnitudes of three-dimensional signals (variables containing `Magnitude`) were calculated using the Euclidean norm.

The measurements are classified in two domains:

- Time-domain signals (variables prefixed by `timeDomain`), resulting from the capture of accelerometer and gyroscope raw signals.

- Frequency-domain signals (variables prefixed by `frequencyDomain`), resulting from the application of a Fast Fourier Transform (FFT) to some of the time-domain signals.

#### Time-domain signals

- Mean time-domain body acceleration in the X, Y and Z directions;
- Standard deviation of the time-domain body acceleration in the X, Y and Z directions;
- Mean time-domain gravity acceleration in the X, Y and Z directions;
- Standard deviation of the time-domain gravity acceleration in the X, Y and Z directions;
- Mean time-domain body acceleration jerk (derivation of the acceleration in time) in the X, Y and Z directions;
- Standard deviation of the time-domain body acceleration jerk (derivation of the acceleration in time) in the X, Y and Z directions;
- Mean time-domain body angular velocity in the X, Y and Z directions;
- Standard deviation of the time-domain body angular velocity in the X, Y and Z directions;
- Mean time-domain body angular velocity jerk (derivation of the angular velocity in time) in the X, Y and Z directions;
- Standard deviation of the time-domain body angular velocity jerk (derivation of the angular velocity in time) in the X, Y and Z directions;
- Mean and standard deviation of the time-domain magnitude of body acceleration;
- Mean and standard deviation of the time-domain magnitude of gravity acceleration;
- Mean and standard deviation of the time-domain magnitude of body acceleration jerk (derivation of the acceleration in time);
- Mean and standard deviation of the time-domain magnitude of body angular velocity;
- Mean and standard deviation of the time-domain magnitude of body angular velocity jerk (derivation of the angular velocity in time);
#### Frequency-domain signals

- Mean frequency-domain body acceleration in the X, Y and Z directions;
- Standard deviation of the frequency-domain body acceleration in the X, Y and Z directions;
- Weighted average of the frequency components of the frequency-domain body acceleration in the X, Y and Z directions;
- Mean frequency-domain body acceleration jerk (derivation of the acceleration in time) in the X, Y and Z directions;
- Standard deviation of the frequency-domain body acceleration jerk (derivation of the acceleration in time) in the X, Y and Z directions;
- Weighted average of the frequency components of the frequency-domain body acceleration jerk (derivation of the acceleration in time) in the X, Y and Z directions;
- Mean frequency-domain body angular velocity in the X, Y and Z directions;
- Standard deviation of the frequency-domain body angular velocity in the X, Y and Z directions;
- Weighted average of the frequency components of the frequency-domain body angular velocity in the X, Y and Z directions;
- Mean, standard deviation, and weighted average of the frequency components of the frequency-domain magnitude of body acceleration;
- Mean, standard deviation, and weighted average of the frequency components of the frequency-domain magnitude of body acceleration jerk (derivation of the acceleration in time);
- Mean, standard deviation, and weighted average of the frequency components of the frequency-domain magnitude of body angular velocity;
- Mean, standard deviation, and weighted average of the frequency components of the frequency-domain magnitude of body angular velocity jerk (derivation of the angular velocity in time);

## Data cleaning

The zip file containing the source data is located at [https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip).

To prepare data next technics were applied to set(`run_analysis.R`):

1. The training and test sets were merged in one data set.
2. The variables on the mean and standard deviation were extracted for each measurement, and the others were discarded.
3. The activity identifiers were replaced with descriptive activity names.
4. The variable names were replaced with descriptive variable names.
5. From the data set in step 4, the final data set was created with the average of each variable for each activity and each subject.