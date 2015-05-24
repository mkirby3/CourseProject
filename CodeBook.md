---
title: "Code Book"
author: "Mike Kirby"
date: "Sunday, May 24, 2015"
output: html_document
---

This code book describes the variables, the data, and all transformations and work that was performed to clean up the data.

-The tidy data set written to samsungTidyData.txt has 180 rows and 88 columns. 

-Each row in the data set corresponds to a unique Subject-Activity pair, and contains the mean of each of the included variables obtained from the raw data set.

-Each column in the tidy data set contains values for a unique variable.

-The Subject column contains integer values between 1 and 30 corresponding to the subject who the measurement were taken from.

-The Activity column contains six categorical values indicating the activity that the subject was performing while the given measurement was being taken. These activities include walking, walking upstairs, walking downstairs, sitting, standing, and laying.

-The remaining 86 columns contain the averages of each of the included variables obtained from the raw data set. The variables that were obtained from the raw data set are measurements on the mean and standard deviation for each measurement. 

-The transformations that were performed in 'run_analysis.R' that convert the raw data set to the tidy data set are outlined step-by-step within the 'run_analysis.R' script

