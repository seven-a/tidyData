library(readr)
if(!file.exists("./samsung data")){
  print("raw data missing, move raw data to folder ./samsung data")
  } else {
  #reading files
  library(readr)  
  library(dplyr)  
    
  subject_test <- read_table("./samsung data/test/subject_test.txt", col_names = FALSE)
  x_test <- read_table("./samsung data/test/X_test.txt", col_names = FALSE)
  y_test <- read_table("./samsung data/test/y_test.txt", col_names = FALSE)
  
  subject_train <- read_table("./samsung data/train/subject_train.txt", col_names = FALSE)
  x_train <- read_table("./samsung data/train/X_train.txt", col_names = FALSE)
  y_train <- read_table("./samsung data/train/y_train.txt", col_names = FALSE)
  
  features <- read_table2("./samsung data/features.txt", col_names = FALSE)
  activity_labels <- read_table2("./samsung data/activity_labels.txt", col_names = FALSE)
  
  names(subject_test) <- "subject"
  names(subject_train) <- "subject"
  names(y_test) <- "activity"
  names(y_train) <- "activity"
  
  #merging data
  x_test <- cbind(subject_test, y_test, x_test)
  x_train <- cbind(subject_train, y_train, x_train)
  alldata <- rbind(x_test, x_train)
  rm(x_test, x_train)
  
  #extracting mean and avg coulumns from alldata and naming coulumns
  mscol <- grep("mean\\(\\)|std", features$X2)  #extracting mean() and std() names
  mscoldf <- features[mscol,]                   #colnames dataframe
  mscoldf$X2 <- gsub("-", ".", mscoldf$X2)      #simplify names
  mscoldf$X2 <- gsub("\\()", "", mscoldf$X2)
  
  datams <- alldata[, c(1, 2, mscol+2)]         #extracting data
  colnames(datams)[3:68] <- mscoldf$X2          #renaming
  rm(alldata)
  
  #set activity names to activity coulumn
  funk <- function(k) activity_labels$X2[k]
  datams$activity <- sapply(datams$activity, funk)
  
  #creating independent tidy dataset
  datams %>%
    group_by(subject, activity) %>%
    summarise_all(mean) %>%
    write.table(file = "tidyData.txt", row.name=FALSE)
  
  
  }
