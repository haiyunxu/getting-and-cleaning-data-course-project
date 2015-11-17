library(plyr)

# 1. get the dataset and unzip
fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileURL, 'dataset.zip', method="curl")
unzip('dataset.zip')

# 2. Load the training and the test sets, and labels the data set with descriptive variable names.
features <- read.table("UCI HAR Dataset/features.txt",stringsAsFactors=FALSE)

traindata <- read.table("UCI HAR Dataset/train/X_train.txt")
trainlabel <- read.table("UCI HAR Dataset/train/Y_train.txt")
trainsubj <- read.table("UCI HAR Dataset/train/subject_train.txt")
train <- cbind(trainsubj,trainlabel,traindata)
colnames(train)<-c('Subject','Activity',features[,2])

testdata <- read.table("UCI HAR Dataset/test/X_test.txt")
testlabel <- read.table("UCI HAR Dataset/test/Y_test.txt")
testsubj <- read.table("UCI HAR Dataset/test/subject_test.txt")
test <- cbind(testsubj,testlabel,testdata)
colnames(test)<-c('Subject','Activity',features[,2])

# 3. Merge the training and test sets to 'onedata'
onedata <- rbind(train,test)

# 4. Extracts only the measurements on the mean and sd for each measurement. 
meansdfeatures<-grep(".*mean.*|.*std.*",features[,2])
meansdindex<-c(1,2,meansdfeatures+2)
onedata_meansd<-onedata[,meansdindex]

# 5. Uses descriptive activity names to name the activities in the data set
activitylabels <- read.table("UCI HAR Dataset/activity_labels.txt",stringsAsFactors=FALSE)
onedata_meansd$Activity<-activitylabels[onedata_meansd$Activity,2]

# 6. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.  
mean_data <- ddply(onedata_meansd, .(Subject, Activity), function(x) colMeans(x[, 3:ncol(onedata_meansd)]))
write.table(mean_data, "mean_data.txt", row.name=TRUE)