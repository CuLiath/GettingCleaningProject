---
title: "CodeBook for Getting/Cleaning Project"
author: "Lynn Kiaer"
date: "Saturday, October 25, 2014"
output: html_document
---

The data was downloaded using the link provided on the assignment page, arriving as a .zip file.

The files were unzipped into a data directory.

The R script *run_analysis.R* is a heavily documented, self-contained script containing all the steps that were undertaken from that point on.

An overview of the steps:

These steps were taken on both the "test" and "train" data.  I will describe the steps using the test data set.

+  Read in the file *data/UCI HAR Dataset/test/X_test.txt*.  (Note that this makes clear the data structure that was unzipped.)  This file contains 561 columns of data, no headers.  It also lacks identifying data, specifically the activity and subject being studied for each record.
+  Read in the file *data/UCI HAR Dataset/test/y_test.txt*.  This is simply a vector of activity codes, with a range of 1-6 indicating

1. **Walk**: Walking on a level surface
2. **WalkUp**: Walking up stairs
3. **WalkDown**: Walking down stairs
4. **Sit**: Sitting down
5. **Stand**: Standing still
6. **Rest**: Lying down

+ Read in the file *data/UCI HAR Dataset/test/subject_test.txt*.  This is the corresponding vector of subject IDs, ranging from 1 to 30.
+ The three files were combined to form a data set with the Activity Code in the first column, then the subject, and then the 561 columns of data.

After repeating with the training data set, the test and training data sets were combined into a single dataset having 10299 records.

The Activity Code column was replaced with a vector of strings, replacing the codes with the bolded names shown in the list above.

At this point, the data of interest (those fields of the original data whose names included *mean()* or *stdev()*) was pulled out.  There were 68 such columns.

The columns were given descriptive names. 

Finally, the data was summarized by taking the mean for each column, by activity and subject.  This resulted in a total of 180 observations.

+ The first column is Activity, with values from "Walk", "WalkUp", "WalkDown", "Sit", "Stand", "Rest".
+ The second column is Subject, with integer values between 1 and 30, inclusive, indicating the subject.
+ The remaining columns are named based on the name in the original dataset.  Those original dataset names have the name of an estimated variable, followed by a hyphen, then a characteristic (or statistic) associated with that variable.  All the columns chosen had either mean() or stdev() as part of the characteristic.  The column names in the tidy data set are of the form VariableMean (or VariableStDev) for those variables that had just one characteristic mean (standard deviation), or of the form VariableMeanX (VariableMeanY, VariableMeanZ, VariableStDevX, etc.) for those variables that had a mean (standard deviation) broke out by axis.

Please see the R script *run_analysis.R* for any additional details.