library(reshape2)

activity_labels <- read.table("data/UCI HAR Dataset/activity_labels.txt")[,2]
features <- read.table("data/UCI HAR Dataset/features.txt")[,2]
desired_features <- grepl("mean|std", features)

x_test <- read.table("data/UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("data/UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("data/UCI HAR Dataset/test/subject_test.txt")

names(x_test) <- features
x_test <- x_test[,desired_features]
y_test[,2] <- activity_labels[y_test[,1]]
names(y_test) <- c("Activity_ID", "Activity_Label")
names(subject_test) <- "subject"
test_data <- cbind(subject_test, y_test, x_test)

x_train <- read.table("data/UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("data/UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("data/UCI HAR Dataset/train/subject_train.txt")

names(x_train) <- features
x_train <- x_train[,desired_features]
y_train[,2] <- activity_labels[y_train[,1]]
names(y_train) <- c("Activity_ID", "Activity_Label")
names(subject_train) <- "subject"
train_data <- cbind(subject_train, y_train, x_train)

data <- rbind(test_data, train_data)
id_labels <- c("subject", "Activity_ID", "Activity_Label")
data_labels <- setdiff(colnames(data), id_labels)
melted_data <- melt(data, id = id_labels, measure.vars = data_labels)
tidy <- dcast(melted_data, subject + Activity_Label ~ variable, mean)

write.csv(tidy, file = "./data/UCI_HAR_Tidy.csv", row.names=FALSE)