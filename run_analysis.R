##	This script attempts to carry out the requirements for the 
##	Getting and Cleaning Data Course Project

##	The first step is to read in the data

testfilename <- "./data/UCI HAR Dataset/test/X_test.txt"
test <- read.delim(testfilename, header = FALSE, sep = "")
trainfilename <- "./data/UCI HAR Dataset/train/X_train.txt"
train <- read.delim(trainfilename, header = FALSE, sep = "")

##	There are 2947 rows (and 561 columns, thank goodness!) in test
##	and 7352 rows in train.

## 	But I need to get the activity associated with each record

testactivityfilename <- "./data/UCI HAR Dataset/test/y_test.txt"
testactivity <- read.delim(testactivityfilename, header = FALSE, sep = "")
trainactivityfilename <- "./data/UCI HAR Dataset/train/y_train.txt"
trainactivity <- read.delim(trainactivityfilename, header = FALSE, sep = "")

##	These seem to have the proper number of rows also.  Whew!

##	Finally, I need to get the subject associated with each record

testsubjectfilename <- "./"
testsubjects <- read.delim(testsubjectfilename, header = FALSE, sep = "")
trainsubjectfilename <- "./data/UCI HAR Dataset/train/subject_train.txt"
trainsubjects <- read.delim(trainsubjectfilename, header = FALSE, sep = "")

## 	So far, so good.  Now to get them all into one dataset...

testdata <- cbind(testactivity, testsubjects, test)
traindata <- cbind(trainactivity, trainsubjects, train)

##	Now to pack the two datasets together...

mergedata <- rbind(testdata, traindata)

##	WooHoo!  Except that I have 3 columns named V1...

names(mergedata)[1] <- "ActivityID"
names(mergedata)[2] <- "SubjectID"

##	mergedata is the single dataset containing the test and train data

##	***	END OF STEP 1		***

##	The second step is to extract the relevant columns of data

##	It would be nice to be able to programmatically select the desired 
##	columns, but that is beyond me at this point.  

##	Columns V1 through V40 are tBodyAcc columns
##	V1-V6 are means (X, Y and Z ) and stdevs
##	V41-V46 are tGravityAcc mean/stdev columns
##	V81-V86 are tBodyAccJerk mean/stdev columns
##	V121-V126 are tBodyGyro mean/stdev columns
##	V161-V166 are tBodyGyroJerk mean/stdev columns
##	But then the pattern breaks...
##	V201-V202 are tBodyAccMag mean and stdev
##	V214-V215 are tGravityAccMag mean and stdev
##	V227-V228 are tBodyAccJerkMag mean and stdev
##	V240-V241 are tBodyGyroMag mean and stdev
##	V253-V254 are tBodyGyroJerkMag mean and stdev
##	Another pattern change...
##	V266-V271 are fBodyAcc mean/stdev columns
##	V345-V350 are fBodyAccJerk mean/stdev columns
##	V424-V429 are fBodyGyro mean/stdev columns
##	V503-V504 are fBodyAccMag mean and stdev
##	V516-V517 are fBodyBodyAccJerkMag mean and stdev
##	V529-V530 are fBodyBodyGyroMag mean and stdev
##	V542-V543 are fBodyBodyGyroJerkMag mean and stdev

##	And that's it for means and standard deviations!
## 	A total of 66 columns, plus activity and subject.

##	So, this isn't exactly elegant, but ...

relevantdata <- cbind(mergedata[, 1:8], mergedata[, 43:48], mergedata[, 83:88])
relevantdata <- cbind(relevantdata, mergedata[, 123:128], mergedata[, 163:168])
relevantdata <- cbind(relevantdata, mergedata[, 203:204], mergedata[, 216:217])
relevantdata <- cbind(relevantdata, mergedata[, 229:230], mergedata[, 242:243])
relevantdata <- cbind(relevantdata, mergedata[, 255:256], mergedata[, 268:273])
relevantdata <- cbind(relevantdata, mergedata[, 347:352], mergedata[, 426:431])
relevantdata <- cbind(relevantdata, mergedata[, 505:506], mergedata[, 518:519])
relevantdata <- cbind(relevantdata, mergedata[, 531:532], mergedata[, 544:545])

## 	relevantdata contains the mean and standard deviation fields of the dataset

##	***	END OF STEP 2		***

##	The third step is to name the activities
##	The database side of me wants to have a lookup table...

Activities <- c("Walk", "WalkUp", "WalkDown", "Sit", "Stand", "Rest")
relevantdata[, 69] <- Activities[relevantdata[, 1]]

##	Now we can clean it up a little...

data <- cbind(relevantdata[, 69], relevantdata[, 2:68])
names(data)[1] <- "Activity"

##	data contains the data with activity names

##	***	End of Step 3		***

##	The fourth step is to name the data columns
## 	This isn't going to be pretty either...

names(data)[3] <- "tBodyAccMeanX"
names(data)[4] <- "tBodyAccMeanY"
names(data)[5] <- "tBodyAccMeanZ"
names(data)[6] <- "tBodyAccStDevX"
names(data)[7] <- "tBodyAccStDevY"
names(data)[8] <- "tBodyAccStDevZ"
names(data)[9] <- "tGravityAccMeanX"
names(data)[10] <- "tGravityAccMeanY"
names(data)[11] <- "tGravityAccMeanZ"
names(data)[12] <- "tGravityAccStDevX"
names(data)[13] <- "tGravityAccStDevY"
names(data)[14] <- "tGravityAccStDevZ"
names(data)[15] <- "tBodyAccJerkMeanX"
names(data)[16] <- "tBodyAccJerkMeanY"
names(data)[17] <- "tBodyAccJerkMeanZ"
names(data)[18] <- "tBodyAccJerkStDevX"
names(data)[19] <- "tBodyAccJerkStDevY"
names(data)[20] <- "tBodyAccJerkStDevZ"
names(data)[21] <- "tBodyGyroMeanX"
names(data)[22] <- "tBodyGyroMeanY"
names(data)[23] <- "tBodyGyroMeanZ"
names(data)[24] <- "tBodyGyroStDevX"
names(data)[25] <- "tBodyGyroStDevY"
names(data)[26] <- "tBodyGyroStDevZ"
names(data)[27] <- "tBodyGyroJerkMeanX"
names(data)[28] <- "tBodyGyroJerkMeanY"
names(data)[29] <- "tBodyGyroJerkMeanZ"
names(data)[30] <- "tBodyGyroJerkStDevX"
names(data)[31] <- "tBodyGyroJerkStDevY"
names(data)[32] <- "tBodyGyroJerkStDevZ"
names(data)[33] <- "tBodyAccMagMean"
names(data)[34] <- "tBodyAccMagStDev"
names(data)[35] <- "tGravityAccMagMean"
names(data)[36] <- "tGravityAccMagStDev"
names(data)[37] <- "tBodyAccJerkMagMean"
names(data)[38] <- "tBodyAccJerkMagStDev"
names(data)[39] <- "tBodyGyroMagMean"
names(data)[40] <- "tBodyGyroMagStDev"
names(data)[41] <- "tBodyGyroJerkMagMean"
names(data)[42] <- "tBodyGyroJerkMagStDev"
names(data)[43] <- "fBodyAccMeanX"
names(data)[44] <- "fBodyAccMeanY"
names(data)[45] <- "fBodyAccMeanZ"
names(data)[46] <- "fBodyAccStDevX"
names(data)[47] <- "fBodyAccStDevY"
names(data)[48] <- "fBodyAccStDevZ"
names(data)[49] <- "fBodyAccJerkMeanX"
names(data)[50] <- "fBodyAccJerkMeanY"
names(data)[51] <- "fBodyAccJerkMeanZ"
names(data)[52] <- "fBodyAccJerkStDevX"
names(data)[53] <- "fBodyAccJerkStDevY"
names(data)[54] <- "fBodyAccJerkStDevZ"
names(data)[55] <- "fBodyGyroMeanX"
names(data)[56] <- "fBodyGyroMeanY"
names(data)[57] <- "fBodyGyroMeanZ"
names(data)[58] <- "fBodyGyroStDevX"
names(data)[59] <- "fBodyGyroStDevY"
names(data)[60] <- "fBodyGyroStDevZ"
names(data)[61] <- "fBodyAccMagMean"
names(data)[62] <- "fBodyAccMagStDev"
names(data)[63] <- "fBodyBodyAccJerkMagMean"
names(data)[64] <- "fBodyBodyAccJerkMagStDev"
names(data)[65] <- "fBodyBodyGyroMagMean"
names(data)[66] <- "fBodyBodyGyroMagStDev"
names(data)[67] <- "fBodyBodyGyroJerkMagMean"
names(data)[68] <- "fBodyBodyGyroJerkMagStDev"

##	data now has descriptive names for every variable
##	mind you, I don't really know what they mean...

##	***	END OF STEP 4		***

##	The fifth and final step is to create a new data set
##	that contains the average of each variable
##	by activity and subject

##	It really seems like there ought to be a way to do this 
##	without a loop...  But I can't figure out what to google ...
##	mapply seems like the relevant command, but ...

##	INITIALIZE LOOP
tidydata <- aggregate(data[, 3], by = list(data$Activity, data$Subject), mean)
i <- 4
##	WHILE LOOP
while(i <= 68) {
	temp <- aggregate(data[, i], by = list(data$Activity, data$Subject), mean)
	tidydata <- cbind(tidydata, temp[3])
	i <- i + 1
}

##	Now tidydata contains the desired tidy data set!

##	Write it out!

write.csv(tidydata, file = "./data/tidydata.csv", row.names = FALSE)
