project_url<-'https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip'
if(!file.exists("./project_dir")){dir.create("./project_dir")}
download.file( project_url,destfile = "./project_dir/project_zip_file.zip",method= 'curl')
unzip(zipfile="./project_dir/project_zip_file.zip",exdir="./project_dir")
list.files("project_dir",recursive = TRUE)



subject_train<-read.table("./UCI HAR Dataset/train/subject_train.txt",header=FALSE )
x_train<-read.table("./project_dir/UCI HAR Dataset/train/x_train.txt",header=FALSE )
y_train<-read.table("./project_dir/UCI HAR Dataset/train/y_train.txt",header=FALSE )



subject_test<-read.table("./project_dir/UCI HAR Dataset/test/subject_test.txt",header=FALSE )
x_test<-read.table("./project_dir/UCI HAR Dataset/test/x_test.txt",header=FALSE )
y_test<-read.table("./project_dir/UCI HAR Dataset/test/y_test.txt",header=FALSE )

#Mergin Data
x_set<-rbind(x_train,x_test)
y_set<-rbind(y_train,y_test)
subject_set<-rbind(subject_train,subject_test)

dim(subject_set)
dim(x_set)
dim(y_set)


mean_std <- x_set[, grep("-(mean|std)\\(\\)", read.table("./project_dir/UCI HAR Dataset/features.txt")[, 2])]

dim(mean_std)

 y_set[, 1]<-read.table("./project_dir/UCI HAR Dataset/activity_labels.txt")[y_set[,1],2]
names(y_set) <- "Activity"
 View(activity)

names(subject_set)<-"Subject"

 s_set<-cbind(mean_std,y_set,subject_set)
colnames<-colnames(s_set)
colnames<-make.names(colnames,unique=TRUE)
colnamesclean<-gsub("-", " ", colnames)
colnamesclean<-gsub("\\.", " ", colnamesclean)
colnamesclean<-gsub("\\  ", " ", colnamesclean)
colnamesclean<-gsub("\\  ", " ", colnamesclean)
colnamesclean<-gsub("\\  ", " ", colnamesclean)
colnamesclean<-gsub("tBody", "Body", colnamesclean)
colnamesclean<-gsub("tGravity", "Gravity", colnamesclean) 
colnamesclean<-gsub("fBody", "Body", colnamesclean)
colnamesclean<-gsub("BodyBody", "Body", colnamesclean) 
colnamesclean<-gsub("^\\s+|\\s+$", "", colnamesclean)
colnames(s_set)


## creates a second, independent tidy ,

ind_data<-aggregate(. ~Subject + Activity, s_set, mean)
int_data<-int_data[order(int_data$Subject,int_data$Activity),]
write.table(int_data, file = "tidydata.txt",row.name = FALSE)

