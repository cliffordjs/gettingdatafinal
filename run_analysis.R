#rm(list=ls())
setwd("~/Desktop/datasciencecoursera/Module3")
getwd()
require(plyr)
list.files()

#list.files()
subject_train<-tbl_df(read.table("~/Desktop/datasciencecoursera/Module3/UCI HAR Dataset/train/subject_train.txt", sep="", stringsAsFactors=FALSE, header=FALSE))
x_train<-tbl_df(read.table("~/Desktop/datasciencecoursera/Module3/UCI HAR Dataset/train/X_train.txt", sep="", stringsAsFactors=FALSE, header=FALSE))
y_train<-tbl_df(read.table("~/Desktop/datasciencecoursera/Module3/UCI HAR Dataset/train/y_train.txt", sep="", stringsAsFactors=FALSE, header=FALSE))

subject_test<-tbl_df(read.table("~/Desktop/datasciencecoursera/Module3/UCI HAR Dataset/test/subject_test.txt", sep="", stringsAsFactors=FALSE, header=FALSE))
x_test<-tbl_df(read.table("~/Desktop/datasciencecoursera/Module3/UCI HAR Dataset/test/X_test.txt", sep="", stringsAsFactors=FALSE, header=FALSE))
y_test<-tbl_df(read.table("~/Desktop/datasciencecoursera/Module3/UCI HAR Dataset/test/y_test.txt", sep="", stringsAsFactors=FALSE, header=FALSE))

x_data<-rbind(x_train, x_test)
y_data<-rbind(y_train, y_test)
subject_data<-rbind(subject_train, subject_test)
head(y_data)

names(x_data)
feature_name<-read.table("UCI HAR Dataset/features.txt")
mean_sd<-grep("-(mean|std)\\(\\)", feature_name[,2])
x_needed<-x_data[,mean_sd]
head(x_needed)
names(x_needed)<-feature_name[mean_sd,2]
head(x_needed)

activitylabs<-read.table("UCI HAR Dataset/activity_labels.txt")
y_data[,1]<-activitylabs[y_data[,1],2]
names(y_data)<-"activity"
head(y_data)

names(subject_data) <- "subject"
alldata<-cbind(x_data, y_data, subject_data)

averages <- ddply(alldata, .(subject, activity), function(x) colMeans(x[, 1:66]))

head(averages)


write.table(averages, "averages_data.txt", row.name=FALSE)

























