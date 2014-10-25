---
title: "Getting/Cleaning Course Project"
author: "Lynn Kiaer"
date: "Saturday, October 25, 2014"
output: html_document
---
## Introduction
This project asks us to write a single script to accomplish the following tasks:

1. Merge two files into a single dataset
2. Extract "only the measurements on the mean and standard deviation for each measurement"
3. Name the activities in the data set using descriptive names
4. Label the data set with descriptive variable names
5. Create a tidy data set with the average of each variable by activity and subject

The data set includes only six actual measurements: 

1. tAcc-X
2. tAcc-Y
3. tAcc-Z
4. tGyro-X
5. tGyro-Y
6. tGyro-Z

All the feature fields are calculated values as described in the file *features_info.txt*.  However, it appears that the intention of the assignment is for us to extract data from the files of features, which do not include any of the actual measurements, but instead consist only of calculated fields.

I'm making an executive decision here to use the features that have the designation mean() and stdev() at the ends of their names.  The other designations indicate other kinds of summarization.  This seems to be the intent of the otherwise confusing second step.  It might be more accurate to ask us to extract the fields (or columns) that contain the mean and standard deviation for each calculated (or estimated) variable.

## Requirements
The only requirement is that the data set be extracted into a subdirectory, data, of the working directory, retaining the directory structure of the original data.

