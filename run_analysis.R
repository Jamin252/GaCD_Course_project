library(tidyr)
library(plyr)
library(magrittr)

run_analysis <- function()
{
    #Find the column index that are measurements of mean or stand
    #deviation
    featuresPath <- "./UCI HAR Dataset/features.txt"
    features <- read.table(featuresPath, header= FALSE,sep = " ")
    condition <- "mean[()]|std[()]"
    featureIndex <- grep(condition, features[,2])
    featureNames <- grep(condition, features[,2], value = TRUE)
    
    #Editing featureNames
    featureNames <- gsub("-", "", featureNames)
    featureNames <- tolower(featureNames)
    featureNames <- gsub("\\(\\)", "", featureNames)
    
    #Get the training set and testing set
    trainPath <- "./UCI HAR Dataset/train/X_train.txt"
    testPath <- "./UCI HAR Dataset/test/X_test.txt"
    xTrain <- read.table(trainPath,header = FALSE)
    xTest <- read.table(testPath,header = FALSE)
    
    #Get the column containing mean or std
    xTrain <- xTrain[,featureIndex]
    xTest <- xTest[,featureIndex]
    xData <- rbind(xTrain,xTest)
    colnames(xData) <- featureNames

    
    #Get the y training set and testing set
    yTrainPath <- "./UCI HAR Dataset/train/y_train.txt"
    yTestPath <- "./UCI HAR Dataset/test/y_test.txt"
    yTrain <- read.table(yTrainPath,header = FALSE, col.names = "activity")
    yTest <- read.table(yTestPath, header =FALSE,col.names = "activity")
    ydata <- rbind(yTrain, yTest)
    
    #Get all activity labels
    actPath <- "./UCI HAR Dataset/activity_labels.txt"
    actLabel <- read.table(actPath, header = FALSE, sep = " ")
    
    ydata$activity <- actLabel[ydata$activity,2]
    
    
    #Merge 2 tables
    data <- cbind(xData,ydata)
    
    #Get Subject tables
    subTrain <- read.table("./UCI HAR Dataset/train/subject_train.txt", header= FALSE)
    subTest <- read.table("./UCI HAR Dataset/test/subject_test.txt", header= FALSE)
    subjects <- rbind(subTrain, subTest)
    colnames(subjects) <- "subject"
    
    #merge the table
    data <- cbind(data,subjects)
    
    #step 5, group by and get means
    means <- data %>% group_by(activity,subject) %>% summarise(across(everything(), mean))
    
    return(means)
}