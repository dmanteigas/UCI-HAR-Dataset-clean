test <- read.table("./UCI HAR Dataset/test/X_test.txt",stringsAsFactors=FALSE)
test_ID <- read.table("./UCI HAR Dataset/test/subject_test.txt",stringsAsFactors=FALSE)
test_label <- read.table("./UCI HAR Dataset/test/y_test.txt",stringsAsFactors=FALSE) #reads the 3 files regarding the test dataset
train <- read.table("./UCI HAR Dataset/train/X_train.txt",stringsAsFactors=FALSE)
train_ID <- read.table("./UCI HAR Dataset/train/subject_train.txt",stringsAsFactors=FALSE)
train_label <- read.table("./UCI HAR Dataset/train/y_train.txt",stringsAsFactors=FALSE) #reads the 3 files regarding the train dataset
labels <- read.table("./UCI HAR Dataset/activity_labels.txt",stringsAsFactors=FALSE) #reads the activity labels file
feature <- read.table("./UCI HAR Dataset/features.txt",stringsAsFactors=FALSE) #reads the features file
inter1 <- cbind(test_ID,test_label,test) #binds all the sets regarding the test dateset in a single dataframe
inter2 <- cbind(train_ID,train_label,train) #binds all the sets regarding the train dateset in a single dataframe
final <- rbind(inter1,inter2) #binds the train and test datasets to create a single dataset
colnames(final) <- c("Subject_ID","Activity_ID",feature$V2) #names the columns of the final dataset with the appropriate features
final$Activity_ID <- factor(final$Activity_ID,labels=labels$V2) #transforms activity columns into a factor variable classified according to activity labels file
meanstd_set <- final[ , grepl( "mean", names(final) ) | grepl( "std", names(final) ) ] #extracts only the columns that match the arguments "mean" or "std"
Final_Dataset <- data.frame(final$Subject_ID,final$Activity_ID,meanstd_set) #adds the Subject ID and Activity ID columns to the Final Dataset
colnames(Final_Dataset)[1:2]<- c("Subject_ID","Activity_ID") #removes the "final" from the columns names of Subject ID and Activity ID columns
library(dplyr) #loads dplyr package
Final_Dataset_1 <- tbl_df(Final_Dataset) #transforms dataset into a tbl
Tidy_Dataset_means <- Final_Dataset_1 %>% group_by(Subject_ID,Activity_ID) %>% summarise_each(funs(mean)) #group by subject and activity and calculates de mean of each variable by this grouping
write.table(Tidy_Dataset_means,file="Tidy_Dataset_means.txt",sep=" ") #saves the final dataset into a txt file into your working directory