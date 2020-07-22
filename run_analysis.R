library(data.table)
library(reshape2)

# Load activity labels + features

activityLabels <- fread("F:/project/coursera/cleaning/project/activity_labels.txt" ,col.names=c("classlabels","activityName"))
features <- fread("F:/project/coursera/cleaning/project/features.txt",col.names=c("index","featureNames"))
featuresWanted <- grep("(mean|std)\\(\\)", features[, featureNames])
measurements <- features[featuresWanted, featureNames]
measurements <- gsub('[()]', '', measurements)

# Load train datasets

train <- fread("F:/project/coursera/cleaning/project/train/X_train.txt")[, featuresWanted, with = FALSE]
data.table::setnames(train, colnames(train), measurements)
trainActivities <- fread("F:/project/coursera/cleaning/project/train/Y_train.txt"
                         , col.names = c("Activity"))
trainSubjects <- fread("F:/project/coursera/cleaning/project/train/subject_train.txt"
                       , col.names = c("SubjectNum"))
train <- cbind(trainSubjects, trainActivities, train)


# Load test datasets

test <- fread("F:/project/coursera/cleaning/project/test/X_test.txt")[, featuresWanted, with = FALSE]
                       data.table::setnames(test, colnames(test), measurements)
                       testActivities <- fread("F:/project/coursera/cleaning/project/test/Y_test.txt"
                       , col.names = c("Activity"))
                       testSubjects <- fread("F:/project/coursera/cleaning/project/test/subject_test.txt"
                       , col.names = c("SubjectNum"))
                       test <- cbind(testSubjects, testActivities, test)
                       
# merge datasets

combined <- rbind(train, test)


# Convert classLabels to activityName basically. More explicit.

combined[["Activity"]] <- factor(combined[, Activity]
                                 , levels = activityLabels[["classlabels"]]
                                 , labels = activityLabels[["activityName"]])

combined[["SubjectNum"]] <- as.factor(combined[, SubjectNum])
combined <- reshape2::melt(data = combined, id = c("SubjectNum", "Activity"))
combined <- reshape2::dcast(data = combined, SubjectNum + Activity ~ variable, fun.aggregate = mean)

data.table::fwrite(x = combined, file = "tidyData.txt", quote = FALSE)
