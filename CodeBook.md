---
title: "Code Book"
author: "Mike Kirby"
date: "Sunday, May 24, 2015"
output: html_document
---

This code book describes the variables and data produced in the tidy data set.

* The transformations that were performed in 'run_analysis.R' that convert the raw data set to the tidy data set are outlined step-by-step within the 'run_analysis.R' script

* The tidy data set written to samsungTidyData.txt has 180 rows and 88 columns. 

* Each row in the data set corresponds to a unique Subject-Activity pair, and contains the mean of each of the included variables obtained from the raw data set.

* Each column in the tidy data set contains values for a unique variable.

* The Subject column contains integer values between 1 and 30 corresponding to the subject who the measurements were taken from.

* The Activity column contains six categorical values indicating the activity that the subject was performing while the given measurement was being taken. These activities include walking, walking upstairs, walking downstairs, sitting, standing, and laying.

* The remaining 86 columns contain the averages of each of the included variables obtained from the raw data set. The variables that were obtained from the raw data set are measurements on the mean and standard deviation for each measurement, and are listed below.

 [3] "tBodyAccmeanX"                     "tBodyAccmeanY"                    
 [5] "tBodyAccmeanZ"                     "tBodyAccstdX"                     
 [7] "tBodyAccstdY"                      "tBodyAccstdZ"                     
 [9] "tGravityAccmeanX"                  "tGravityAccmeanY"                 
[11] "tGravityAccmeanZ"                  "tGravityAccstdX"                  
[13] "tGravityAccstdY"                   "tGravityAccstdZ"                  
[15] "tBodyAccJerkmeanX"                 "tBodyAccJerkmeanY"                
[17] "tBodyAccJerkmeanZ"                 "tBodyAccJerkstdX"                 
[19] "tBodyAccJerkstdY"                  "tBodyAccJerkstdZ"                 
[21] "tBodyGyromeanX"                    "tBodyGyromeanY"                   
[23] "tBodyGyromeanZ"                    "tBodyGyrostdX"                    
[25] "tBodyGyrostdY"                     "tBodyGyrostdZ"                    
[27] "tBodyGyroJerkmeanX"                "tBodyGyroJerkmeanY"               
[29] "tBodyGyroJerkmeanZ"                "tBodyGyroJerkstdX"                
[31] "tBodyGyroJerkstdY"                 "tBodyGyroJerkstdZ"                
[33] "tBodyAccMagmean"                   "tBodyAccMagstd"                   
[35] "tGravityAccMagmean"                "tGravityAccMagstd"                
[37] "tBodyAccJerkMagmean"               "tBodyAccJerkMagstd"               
[39] "tBodyGyroMagmean"                  "tBodyGyroMagstd"                  
[41] "tBodyGyroJerkMagmean"              "tBodyGyroJerkMagstd"              
[43] "fBodyAccmeanX"                     "fBodyAccmeanY"                    
[45] "fBodyAccmeanZ"                     "fBodyAccstdX"                     
[47] "fBodyAccstdY"                      "fBodyAccstdZ"                     
[49] "fBodyAccmeanFreqX"                 "fBodyAccmeanFreqY"                
[51] "fBodyAccmeanFreqZ"                 "fBodyAccJerkmeanX"                
[53] "fBodyAccJerkmeanY"                 "fBodyAccJerkmeanZ"                
[55] "fBodyAccJerkstdX"                  "fBodyAccJerkstdY"                 
[57] "fBodyAccJerkstdZ"                  "fBodyAccJerkmeanFreqX"            
[59] "fBodyAccJerkmeanFreqY"             "fBodyAccJerkmeanFreqZ"            
[61] "fBodyGyromeanX"                    "fBodyGyromeanY"                   
[63] "fBodyGyromeanZ"                    "fBodyGyrostdX"                    
[65] "fBodyGyrostdY"                     "fBodyGyrostdZ"                    
[67] "fBodyGyromeanFreqX"                "fBodyGyromeanFreqY"               
[69] "fBodyGyromeanFreqZ"                "fBodyAccMagmean"                  
[71] "fBodyAccMagstd"                    "fBodyAccMagmeanFreq"              
[73] "fBodyBodyAccJerkMagmean"           "fBodyBodyAccJerkMagstd"           
[75] "fBodyBodyAccJerkMagmeanFreq"       "fBodyBodyGyroMagmean"             
[77] "fBodyBodyGyroMagstd"               "fBodyBodyGyroMagmeanFreq"         
[79] "fBodyBodyGyroJerkMagmean"          "fBodyBodyGyroJerkMagstd"          
[81] "fBodyBodyGyroJerkMagmeanFreq"      "angletBodyAccMeangravity"         
[83] "angletBodyAccJerkMeangravityMean"  "angletBodyGyroMeangravityMean"    
[85] "angletBodyGyroJerkMeangravityMean" "angleXgravityMean"                
[87] "angleYgravityMean"                 "angleZgravityMean"

* The description of the variables above from the orginal source is shown below.

> The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 
Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 
Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 
These signals were used to estimate variables of the feature vector for each pattern: '-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

* The set of variables that were estimated from these signals are: 
      + mean(): Mean value
      + std(): Standard deviation
      + angle(): Angle between two vectors

* Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:
      + gravityMean
      + tBodyAccMean
      + tBodyAccJerkMean
      + tBodyGyroMean
      + tBodyGyroJerkMean