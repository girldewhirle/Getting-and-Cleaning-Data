---
title: "CodeBook"
author: "girldewhirle"
date: "Monday, March 16, 2015"
output: html_document
---

This code book contains details of the 81 variables included in the final output file.  For details of how the run_analysis.R script created the tidy output file please refer to the accompanying readme file.<br>

<u>Variables</u><br>

<i>IDs</i><br>

Activity_Label_after_mean<br><br>
- Verbose description of Activity

Subject_ID<br><br>
- ID of Subject carrying out activities

<i>Vector Features</i><br><br>
- all vector features variables will be numeric.  They can be positive or negative.

The following is extracted from the original 'features_info' file found in the data folder.<br>

"<i>The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz.<br>

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag).<br>

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals).<br>

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.</i>"<br>

Of the 561 features included in the original vector only the ones referencing the mean (including the mean frequency) or standard deviation are included.  They were selected by selecting variables which contained the string "mean" and/or "std".<br>

<b>Each of the vector variables below follows the same naming convention which is detailed.</b></br>

tBodyAcc_mean_X<br>
- time domain
- accelerometer
- body
- Mean value
- X direction

tBodyAcc_mean_Y<br>
- time domain
- accelerometer
- body
- Mean value
- Y direction

tBodyAcc_mean_Z<br>
- time domain
- accelerometer
- body
- Mean value
- Z direction

tBodyAcc_std_X<br>
- time domain
- accelerometer
- body
- Standard deviation
- X direction

tBodyAcc_std_Y<br>
- time domain
- accelerometer
- body
- Standard deviation
- Y direction

tBodyAcc_std_Z<br>
- time domain
- accelerometer
- body
- Standard deviation
- Z direction

tGravityAcc_mean_X<br>
- time domain
- accelerometer
- gravity
- Mean value
- X direction

tGravityAcc_mean_Y<br>
- time domain
- accelerometer
- gravity
- Mean value
- Y direction

tGravityAcc_mean_Z<br>
- time domain
- accelerometer
- gravity
- Mean value
- Z direction

tGravityAcc_std_X<br>
- time domain
- accelerometer
- gravity
- Standard deviation
- X direction

tGravityAcc_std_Y<br>
- time domain
- accelerometer
- gravity
- Standard deviation
- Y direction

tGravityAcc_std_Z<br>
- time domain
- accelerometer
- gravity
- Standard deviation
- Z direction

tBodyAccJerk_mean_X<br>
- time domain
- accelerometer
- body
- jerk signal
- Mean value
- X direction

tBodyAccJerk_mean_Y<br>
- time domain
- accelerometer
- body
- jerk signal
- Mean value
- Y direction

tBodyAccJerk_mean_Z<br>
- time domain
- accelerometer
- body
- jerk signal
- Mean value
- Z direction

tBodyAccJerk_std_X<br>
- time domain
- accelerometer
- body
- jerk signal
- Standard deviation
- X direction

tBodyAccJerk_std_Y<br>
- time domain
- accelerometer
- body
- jerk signal
- Standard deviation
- Y direction

tBodyAccJerk_std_Z<br>
- time domain
- accelerometer
- body
- jerk signal
- Standard deviation
- Z direction

tBodyGyro_mean_X<br>
- time domain
- gyroscope
- body
- Mean value
- X direction

tBodyGyro_mean_Y<br>
- time domain
- gyroscope
- body
- Mean value
- Y direction

tBodyGyro_mean_Z<br>
- time domain
- gyroscope
- body
- Mean value
- Z direction

tBodyGyro_std_X<br>
- time domain
- gyroscope
- body
- Standard deviation
- X direction

tBodyGyro_std_Y<br>
- time domain
- gyroscope
- body
- Standard deviation
- Y direction

tBodyGyro_std_Z<br>
- time domain
- gyroscope
- body
- Standard deviation
- Z direction

tBodyGyroJerk_mean_X<br>
- time domain
- gyroscope
- body
- jerk signal
- Mean value
- X direction

tBodyGyroJerk_mean_Y<br>
- time domain
- gyroscope
- body
- jerk signal
- Mean value
- Y direction

tBodyGyroJerk_mean_Z<br>
- time domain
- gyroscope
- body
- jerk signal
- Mean value
- Z direction

tBodyGyroJerk_std_X<br>
- time domain
- gyroscope
- body
- jerk signal
- Standard deviation
- X direction

tBodyGyroJerk_std_Y<br>
- time domain
- gyroscope
- body
- jerk signal
- Standard deviation
- Y direction

tBodyGyroJerk_std_Z<br>
- time domain
- gyroscope
- body
- jerk signal
- Standard deviation
- Z direction

tBodyAccMag_mean<br>
- time domain
- accelerometer
- body
- magnitude
- Mean value

tBodyAccMag_std<br>
- time domain
- accelerometer
- body
- magnitude
- Standard deviation

tGravityAccMag_mean<br>
- time domain
- accelerometer
- gravity
- magnitude
- Mean value

tGravityAccMag_std<br>
- time domain
- accelerometer
- gravity
- magnitude
- Standard deviation

tBodyAccJerkMag_mean<br>
- time domain
- accelerometer
- body
- jerk signal
- magnitude
- Mean value

tBodyAccJerkMag_std<br>
- time domain
- accelerometer
- body
- jerk signal
- magnitude
- Standard deviation

tBodyGyroMag_mean<br>
- time domain
- gyroscope
- body
- magnitude
- Mean value

tBodyGyroMag_std<br>
- time domain
- gyroscope
- body
- magnitude
- Standard deviation

tBodyGyroJerkMag_mean<br>
- time domain
- gyroscope
- body
- jerk signal
- magnitude
- Mean value

tBodyGyroJerkMag_std<br>
- time domain
- gyroscope
- body
- jerk signal
- magnitude
- Standard deviation

fBodyAcc_mean_X<br>
- frequency domain
- accelerometer
- body
- Mean value
- X direction

fBodyAcc_mean_Y<br>
- frequency domain
- accelerometer
- body
- Mean value
- Y direction

fBodyAcc_mean_Z<br>
- frequency domain
- accelerometer
- body
- Mean value
- Z direction

fBodyAcc_std_X<br>
- frequency domain
- accelerometer
- body
- Standard deviation
- X direction

fBodyAcc_std_Y<br>
- frequency domain
- accelerometer
- body
- Standard deviation
- Y direction

fBodyAcc_std_Z<br>
- frequency domain
- accelerometer
- body
- Standard deviation
- Z direction

fBodyAcc_meanFreq_X<br>
- frequency domain
- accelerometer
- body
- mean frequency
- X direction

fBodyAcc_meanFreq_Y<br>
- frequency domain
- accelerometer
- body
- mean frequency
- Y direction

fBodyAcc_meanFreq_Z<br>
- frequency domain
- accelerometer
- body
- mean frequency
- Z direction

fBodyAccJerk_mean_X<br>
- frequency domain
- accelerometer
- body
- jerk signal
- Mean value
- X direction

fBodyAccJerk_mean_Y<br>
- frequency domain
- accelerometer
- body
- jerk signal
- Mean value
- Y direction

fBodyAccJerk_mean_Z<br>
- frequency domain
- accelerometer
- body
- jerk signal
- Mean value
- Z direction

fBodyAccJerk_std_X<br>
- frequency domain
- accelerometer
- body
- jerk signal
- Standard deviation
- X direction

fBodyAccJerk_std_Y<br>
- frequency domain
- accelerometer
- body
- jerk signal
- Standard deviation
- Y direction

fBodyAccJerk_std_Z<br>
- frequency domain
- accelerometer
- body
- jerk signal
- Standard deviation
- Z direction

fBodyAccJerk_meanFreq_X<br>
- frequency domain
- accelerometer
- body
- jerk signal
- mean frequency
- X direction

fBodyAccJerk_meanFreq_Y<br>
- frequency domain
- accelerometer
- body
- jerk signal
- mean frequency
- Y direction

fBodyAccJerk_meanFreq_Z<br>
- frequency domain
- accelerometer
- body
- jerk signal
- mean frequency
- Z direction

fBodyGyro_mean_X<br>
- frequency domain
- gyroscope
- body
- Mean value
- X direction

fBodyGyro_mean_Y<br>
- frequency domain
- gyroscope
- body
- Mean value
- Y direction

fBodyGyro_mean_Z<br>
- frequency domain
- gyroscope
- body
- Mean value
- Z direction

fBodyGyro_std_X<br>
- frequency domain
- gyroscope
- body
- Standard deviation
- X direction

fBodyGyro_std_Y<br>
- frequency domain
- gyroscope
- body
- Standard deviation
- Y direction

fBodyGyro_std_Z<br>
- frequency domain
- gyroscope
- body
- Standard deviation
- Z direction

fBodyGyro_meanFreq_X<br>
- frequency domain
- gyroscope
- body
- mean frequency
- X direction

fBodyGyro_meanFreq_Y<br>
- frequency domain
- gyroscope
- body
- mean frequency
- Y direction

fBodyGyro_meanFreq_Z<br>
- frequency domain
- gyroscope
- body
- mean frequency
- Z direction

fBodyAccMag_mean<br>
- frequency domain
- accelerometer
- body
- magnitude
- Mean value

fBodyAccMag_std<br>
- frequency domain
- accelerometer
- body
- magnitude
- Standard deviation

fBodyAccMag_meanFreq<br>
- frequency domain
- accelerometer
- body
- magnitude
- mean frequency

fBodyBodyAccJerkMag_mean<br>
- frequency domain
- accelerometer
- body
- jerk signal
- magnitude
- Mean value

fBodyBodyAccJerkMag_std<br>
- frequency domain
- accelerometer
- body
- jerk signal
- magnitude
- Standard deviation

fBodyBodyAccJerkMag_meanFreq<br>
- frequency domain
- accelerometer
- body
- jerk signal
- magnitude
- mean frequency

fBodyBodyGyroMag_mean<br>
- frequency domain
- gyroscope
- body
- magnitude
- Mean value

fBodyBodyGyroMag_std<br>
- frequency domain
- gyroscope
- body
- magnitude
- Standard deviation

fBodyBodyGyroMag_meanFreq<br>
- frequency domain
- gyroscope
- body
- magnitude
- mean frequency

fBodyBodyGyroJerkMag_mean<br>
- frequency domain
- gyroscope
- body
- jerk signal
- magnitude
- Mean value

fBodyBodyGyroJerkMag_std<br>
- frequency domain
- gyroscope
- body
- jerk signal
- magnitude
- Standard deviation

fBodyBodyGyroJerkMag_meanFreq<br>
- frequency domain
- gyroscope
- body
- jerk signal
- magnitude
- mean frequency

