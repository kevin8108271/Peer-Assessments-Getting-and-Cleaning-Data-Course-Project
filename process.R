if(!'UCI HAR Dataset' %in% dir()){
    url='https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip'
    download.file(url,destfile="./data.zip")
    unzip("data.zip")
}
##Merges the training and the test sets to create one data set.
setwd(paste(getwd(),"./UCI HAR Dataset",sep=''))
features<-read.table('features.txt',sep='')
x_train<-read.table('./train/X_train.txt',sep='')
y_train<-read.table('./train/y_train.txt',sep='')

x_test<-read.table('./test/X_test.txt',sep='')
y_test<-read.table('./test/y_test.txt',sep='')

subject_train<-read.table('./train/subject_train.txt',sep='')
subject_test<-read.table('./test/subject_test.txt',sep='')

x<-rbind(x_train,x_test)
y<-rbind(y_train,y_test)
subject<-rbind(subject_train,subject_test)

##Extracts only the measurements on the mean and standard deviation for each measurement.
features<-read.table('./features.txt',sep='')
mean_sd<- grep('-mean\\(\\).*|std\\(\\).*',features[,2])
x_mean_sd<-x[,mean_sd]

##Uses descriptive activity names to name the activities in the data set
names(x_mean_sd)<-features[mean_sd,2]
names(x_mean_sd)<-tolower(names(x_mean_sd))
names(x_mean_sd)<-gsub('\\(|\\)',replacement='',names(x_mean_sd))

##Appropriately labels the data set with descriptive variable names. 
act_lab <- read.table('./activity_labels.txt')
act_lab[, 2] <- tolower(act_lab[, 2])
act_lab[, 2] <- gsub("_", "", act_lab[, 2])

y[, 1] = act_lab[y[, 1], 2]
colnames(y) <- 'activity'
colnames(subject) <- 'subject'

data<-cbind(subject,x_mean_sd,y)

##From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
average<-aggregate(data,by=list(data$activity,data$subject),FUN=mean)
average<- average[, !(colnames(average) %in% c("subj", "activity"))]
write.table(average, './average.txt', row.names = F)
