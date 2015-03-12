## This code will create a 'tidy' data set from the raw data files of the UCI data. 
## The data should exist in a subfolder called "ucidata" from your working directory.

## read column names file (features.txt)
feat<-read.table("./ucidata/features.txt")

## read train files
x_train<-read.table("./ucidata/train/X_train.txt")
y_train<-read.table("./ucidata/train/y_train.txt")
sub_train<-read.table("./ucidata/train/subject_train.txt")

## apply names, then cbind them together
names(x_train)<-feat[,2]
names(y_train)<-"Activity"
names(sub_train)<-"Subject"
train<-cbind(sub_train,y_train,x_train)

## read test files
x_test<-read.table("./ucidata/test/X_test.txt")
y_test<-read.table("./ucidata/test/y_test.txt")
sub_test<-read.table("./ucidata/test/subject_test.txt")

## apply names, then cbind them together
names(x_test)<-feat[,2]
names(y_test)<-"Activity"
names(sub_test)<-"Subject"
test<-cbind(sub_test,y_test,x_test)

##rbind test and train into tot
tot<-rbind(train,test)

## use grep function to keep only those columns with the words "mean" and "std" in them (plus the 1st two)
mynames<-c("Subject","Activity","mean","std")
tot2<-tot[grep(paste(mynames,collapse="|"),names(tot),value=T)]

## change activity names to something more readable based on activity_labels.txt
tot2$Activity[tot2$Activity==1]<-"WALKING"
tot2$Activity[tot2$Activity==2]<-"WALKING_UPSTAIRS"
tot2$Activity[tot2$Activity==3]<-"WALKING_DOWNSTAIRS"
tot2$Activity[tot2$Activity==4]<-"SITTING"
tot2$Activity[tot2$Activity==5]<-"STANDING"
tot2$Activity[tot2$Activity==6]<-"LAYING"

tidy1<-tot2              ## tidy1 is our first tidy dataset

tidy2<-aggregate(t[,c(3:81)],list(t$Subject,t$Activity),mean)       ## now aggregate by Subject+Activity
tidy2<-rename(tidy2,c("Group.1"="Subject","Group.2"="Activity"))    ## need to rename 1st two fields due to aggregate fxn

##export to wd in txt format
write.table(tidy2,"tidy.txt",row.names=F)