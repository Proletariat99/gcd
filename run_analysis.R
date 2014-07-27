# GCD_Course_Project - Due 7/27
# 
# You should create one R script called run_analysis.R that does the following. 
# 
# run_analysis.R should do the following:
################  Section 1: Merge the training and the test sets to create one data set. #############
# Some notes on what each files are and their dimensions:
# subject_test = subject identifier number (2946)
# y_test = activity labels (2946)
# X_test = (561, 2946)
# subject_train = subject identifier number (7351)
# y_train = activity labels (7351)
# X_train = (561, 7351)

plat <- .Platform$OS.type
if(plat == "windows"){gcd_path <- "C:\\Users\\Dave\\Google Drive\\dev\\R\\coursera\\gcd";s="\\"
} else { gcd_path <- "~/Google Drive/dev/R/coursera/gcd"; s="/" }
testlabfile <- paste(gcd_path,s,"data",s,"UCI HAR Dataset",s,"test",s,"y_test.txt", sep="")
testsubjfile <- paste(gcd_path,s,"data",s,"UCI HAR Dataset",s,"test",s,"subject_test.txt", sep="")
testdatfile <- paste(gcd_path,s,"data",s,"UCI HAR Dataset",s,"test",s,"X_test.txt", sep="")

trainlabfile <- paste(gcd_path,s,"data",s,"UCI HAR Dataset",s,"train",s,"y_train.txt", sep="")
trainsubjfile <- paste(gcd_path,s,"data",s,"UCI HAR Dataset",s,"train",s,"subject_train.txt", sep="")
traindatfile <- paste(gcd_path,s,"data",s,"UCI HAR Dataset",s,"train",s,"X_train.txt", sep="")

# I'm being lazy about features.txt, because I wanted things to use all 3 separators ("", "-" and ","), so I just used awk from the command line instead; here's that command:
# awk '
# BEGIN{FS="[ ]|[-]|[,]";OFS=","}{$1=$1};{print $0} 
# ' < features.txt > sepfeatures.txt
feat_bd_file <- paste(gcd_path,s,"data",s,"UCI HAR Dataset",s,"sepfeatures.txt", sep="")
feats_bd <- read.delim(feat_bd_file, sep=",", stringsAsFactors=FALSE, header=FALSE, col.names=c("ColNum", "Type", "value", "dimension", "factor")) # feats breakdown
featfile <- paste(gcd_path,s,"data",s,"UCI HAR Dataset",s,"features.txt", sep="")
feats <- read.delim(featfile, sep="", stringsAsFactors=FALSE, header=FALSE, col.names=c("num", "name"))

testlabs <- read.delim(testlabfile, sep="", stringsAsFactors=FALSE, col.names="ActivityCode", header=FALSE)
trainlabs <- read.delim(trainlabfile, sep="", stringsAsFactors=FALSE, col.names="ActivityCode", header=FALSE)
labs <- rbind(testlabs, trainlabs)    # merging test + train the old fashioned way.


testsubj <- read.delim(testsubjfile, sep="", stringsAsFactors=FALSE, col.names="Subject", header=FALSE)
trainsubj <- read.delim(trainsubjfile, sep="", stringsAsFactors=FALSE, col.names="Subject", header=FALSE)
subj <- rbind(testsubj, trainsubj)    # merging test + train the old fashioned way.


testdat <- read.delim(testdatfile, sep="", stringsAsFactors=FALSE, header=FALSE)
traindat <- read.delim(traindatfile, sep="", stringsAsFactors=FALSE, header = FALSE)
dat <- rbind(testdat, traindat)    # merging test + train the old fashioned way.
names(dat) <- c(feats$name)       # Give the columns their proper name.



# Now df contains the following:
# first col = Subject Identifier
# second col = Activity Identifier
# subs. cols = data on all the features.
# rows ... it appears each row is a separate measurement of all the features.
df <- cbind(subj, labs, dat)        # now mush it all together into one d.f. with named columns.
i2 <- grep("std|mean|Mean", names(df))
df2 <- df[,i2]
print(names(df2))



################  Section 3:  Use descriptive activity names to name the activities in the data set
key <- data.frame("num"=c(1:6), "activity"=c("WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTIARS", "SITTING", "STANDING", "LAYING"))

df$activity <- NA    # insert blank column called "activity"  It's at the end, unfortunately, but it'll have to do.
#  now Map Activity Labels to Activity Code
df$activity[df$ActivityCode==1] <- "WALKING"
df$activity[df$ActivityCode==2] <- "WALKING_UPSTAIRS"
df$activity[df$ActivityCode==3] <- "WALKING_DOWNSTAIRS"
df$activity[df$ActivityCode==4] <- "SITTING"
df$activity[df$ActivityCode==5] <- "STANDING"
df$activity[df$ActivityCode==6] <- "LAYING"

write.table(df, file="data_frame.txt", sep=",")

################  Section 4:  Appropriately labels the data set with descriptive variable names. 

print("I pretty much already did this")

################  Section 2:  Extract only the measurements on the mean and standard deviation for each measurement. 
# Moved step 2 below step 3 to include the new labels for activity
i2 <- grep("std|mean|Mean", names(df))   # search df for any "name" containing std, mean or Mean, and write to an index.
df2 <- df[,i2]     # grab just the new indexed values
# print(names(df2))


################  Section 5:  Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 





# Don't forget to submit:
# 1) a tidy data set as described below, 
# 2) a link to a Github repository with your script for performing the analysis, and 
# 3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. 
# 4) You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected. 