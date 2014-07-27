gcd
===

Coursera Getting and Cleaning Data Course


To make this code run, you really just need run_analysis.R and the data files.  The code book might be helpful, but I tried to document most of it inline in run_analysis.R.  Here's what you need to make it go:

./run_analysis.R
./data/UCI HAR Dataset/X_test.txt
./data/UCI HAR Dataset/X_train.txt
./data/UCI HAR Dataset/y_test.txt
./data/UCI HAR Dataset/y_train.txt
./data/UCI HAR Dataset/subject_test.txt
./data/UCI HAR Dataset/subject_train.txt
./data/UCI HAR Dataset/features.txt
./data/UCI HAR Dataset/sepfeatures.txt (if you want fancy regex-separated feature names)

You may have to muck around with the paths in this code:
gcd_path <- "~/Google Drive/dev/R/coursera/gcd"

I'm still not great at making it modular for all users.  Sorry about that.


