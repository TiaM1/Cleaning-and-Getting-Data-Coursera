#
###    set working directory
###
setwd("C:/XXXXXXXX/Course Project")
#
###   load plyr package
##
> library(plyr)
##
###    read in tables and give descriptive names
##
> x_train <- read.table("X_train.txt")
> y_train <- read.table("Y_train.txt")
> subject_train <- read.table("subject_train.txt")
> activity_labes <- read.table("activity_labels.txt")
> features <- read.table("features.txt")
##
#   read in rest of tables
###
> x_test <- read.table("X_test.txt")
> y_test <- read.table("Y_test.txt")
> subject_test <- read.table("subject_test.txt")
###
#   bind rows to create tables with x data, y data, and subject data
> x_table <- rbind(x_train, x_test)
> y_table <- rbind(y_train, y_test)
> subject_table <- rbind(subject_train, subject_test)
###
## identify columns with means and SDs only  
###
>features_meanSD <- grep("-(mean|std)\\(\\)", features[,2])
> x_meanSD <- x_table[, features_meanSD]
###
#    get better column names
###
> names(x_meanSD) <- features[features_meanSD, 2]
########
#   get correct activity names
##
> y_table[,1] <- activity_labes[y_table[,1], 2]
###
#    name "activity" and "subject" columns
##
> names(y_table) <- "activity"
> names(subject_table) <- "subject"
###
#   combine tables
###
> merged_table <- cbind(x_meanSD, y_table, subject_table)
#####
#   create a new tidy data set with the average of each variable for each subject
## must exclude the subject and activity columns
######
tidy_table <- aggregate(.~ activity + subject, data = merged_table, mean)
