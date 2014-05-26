# Clean data and set work directory
rm(list=ls())
setwd("~/Desktop/Courses_Online/Data_Science_Specialization/03_Getting and Cleaning Data/Homework/CourseProject")

# -------------------------- CREATION OF DATASET 1 ---------------------------------

# 1 - Read all files
setwd("./UCI HAR Dataset")
origin_activity_label <- read.table("activity_labels.txt", sep=" ")
origin_activity_label <- as.character(origin_activity_label[,2])
class(origin_activity_label[[1]])
head(origin_activity_label)

origin_features <- read.table("features.txt")
origin_features <- as.character(origin_features[,2])
class(origin_features[2])
head(origin_features)

    # Open data from test folder
setwd("./test")
origin_subject_test <- read.table("subject_test.txt")
head(origin_subject_test)
class(origin_subject_test[[1]])
origintest_X_data <- read.table("X_test.txt")
origintest_Y_data <- read.table("y_test.txt")
class(origintest_X_data)
class(origintest_X_data[[100]])
class(origintest_Y_data[[1]])
setwd("./..")

    # Open data from train folder
setwd("./train")
origin_subject_train <- read.table("subject_train.txt")
head(origin_subject_test)
class(origin_subject_test[[1]])
origintrain_X_data <- read.table("X_train.txt")
origintrain_Y_data <- read.table("y_train.txt")
class(origintrain_X_data[[100]])
class(origintrain_Y_data[[1]])
setwd("./..")

# 2 - Merge test and train data
Subject_data <- rbind(origin_subject_test, origin_subject_train)
X_data <- rbind(origintest_X_data, origintrain_X_data)
Y_data <- rbind(origintest_Y_data, origintrain_Y_data)

# 3 - Names to Columns
colnames(X_data) <- origin_features
# select columns which name contains "mean" or "std"
columns_X <- which(grepl("mean",colnames(X_data)) | grepl("std",colnames(X_data)))
X_data_select <- X_data[columns_X]
head(X_data_select)

colnames(Y_data) <- "activity_label"
colnames(Subject_data) <- "Subject"
head(X_data)
tail(Y_data)
class(Y_data[[1]])

# 4 - Create "DataSet1"
data <- cbind(Subject_data, Y_data, X_data_select)
names(data)


#5 - Save file
    #Set working directory to save the file
setwd("./..")
?write.table
write.table(data, "Dataset_1.txt", row.names = FALSE, col.names = TRUE)


# -------------------------- CREATION OF DATASET 2 ---------------------------------

Mean_data <- data.frame( Subject=integer(30*6), activity_label=integer(30*6), matrix(numeric(79*30*6),ncol=79,nrow=30*6))
names(Mean_data) <- names(data)
k <- 1
for (i in 1:30){
  for (j in 1:6){
    subset_lv <- (data$Subject == i) & (data$activity_label == j)
    #print( sum(subset_lv) )
    #print( length(subset_lv))
    Mean_data[k,"Subject"] <- i
    Mean_data[k,"activity_label"] <- j
    Mean_data[k,3:(2+79)] <- colMeans( data[subset_lv,3:(2+79)])  
    k <- k + 1
  }
}

# Save file
write.table(Mean_data, "Dataset2.txt", row.names = FALSE, col.names = TRUE)
