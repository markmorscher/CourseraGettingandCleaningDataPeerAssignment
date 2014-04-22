# Assume being run from Working Directory and that the unzipped directory exists there.
# Check to make sure directory exists.

while (!file.exists("UCI HAR Dataset")) {
  print("Working directory must have the unzipped UCI HAR Dataset directory and files.")
  print("Please set proper working directory or unzip files.")
  quit()
}

# Read in various txt files
# Get data variable names

colNames = read.table("./UCI HAR Dataset/features.txt", header=FALSE)

# Read in Test Data

dataTest = read.table("./UCI HAR Dataset/test/X_test.txt", header=FALSE, col.names = colNames$V2)

# Read in Training Data

dataTrain= read.table("./UCI HAR Dataset/train/X_train.txt", header=FALSE, col.names = colNames$V2)

# Combine Test and Training Data

data = rbind(dataTrain, dataTest)
rm(dataTest)
rm(dataTrain)

# Keep only Mean and Std measures

measureColNames = names(data)
keepCol = sort(append(grep("mean", measureColNames), grep("std", measureColNames)))
data = subset(data, select = keepCol)

# Repeat for Subject information

subjectTest = read.table("./UCI HAR Dataset/test/subject_test.txt", header=FALSE, col.names = "SubjectID")
subjectTrain= read.table("./UCI HAR Dataset/train/subject_train.txt", header=FALSE, col.names = "SubjectID")
subject = rbind(subjectTrain, subjectTest)
rm(subjectTest)
rm(subjectTrain)

# Repeat for Activity information, as well as merge with activity label

activityTest = read.table("./UCI HAR Dataset/test/y_test.txt", header=FALSE,  col.names = "ActivityID")
activityTrain= read.table("./UCI HAR Dataset/train/y_train.txt", header=FALSE,  col.names = "ActivityID")
activity = rbind(activityTrain, activityTest)

activityLabels = read.table("./UCI HAR Dataset/activity_labels.txt", header=FALSE, col.names = c("ActivityID", "Activity"))
activity = merge(activity, activityLabels, by.x="ActivityID", by.y="ActivityID", all=TRUE)

rm(activityTest)
rm(activityTrain)

# Combine all the data parts into one table

dataCombined = cbind(subject, activity, data)
dataCombined$ActivityID = NULL
rm(data)

# Create Tiny Data set

library(reshape2)
meltedData = melt(dataCombined, id=c("Activity", "SubjectID"))
tinyData = dcast(meltedData, Activity+SubjectID ~ variable, mean)

# Write out to a text file

write.table(tinyData, file = "tinyData.txt")
