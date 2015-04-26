#import training and testing data
#import training and testing data
training<-read.csv("C:\\Users\\jliu28\\Downloads\\pml-training.csv", header=TRUE,na.strings=c("#DIV/0!"))
test<-read.csv("C:\\Users\\jliu28\\Downloads\\pml-testing.csv", header=TRUE, na.strings=c("#DIV/0!"))
#load necessary library
library(rpart) 
#install.packages('randomForest') 
library(randomForest) 
#install.packages('party') 
library(party) 
library(caret)

#converce col 8 to end except [classe] as numberic 
for(i in c(8:ncol(training1)-1)) {training1[,i] = as.numeric(as.character(training1[,i]))}
for(i in c(8:ncol(testing)-1)) {testing[,i] = as.numeric(as.character(testing[,i]))}
# # prepare training data and testing data
Intrain<-createDataPartition(y=training$classe, p=0.7, list=FALSE)
training1<-training[Intrain,]
testing<-training[-Intrain,]
dim(training)
## select columnes with complete data for modeling
feature_col<- colnames(training1[colSums(is.na(training1)) == 0])[-(1:7)]
model_data <- training1[feature_col]
test_data<-testing[fearture_col]
summary(model_data)
dim(model_data)
#modeling with random forest and print out the specificity and sensitivity of the model applied in training and testing data
library(randomForest)
set.seed(2015) 
fit <- randomForest(model_data$classe ~. , 
                    data=model_data, importance=TRUE, ntree=100)
varImpPlot(fit, sort=T) 
predictions1<-predict(fit, newdata=training1)
confusionMatrix(predictions1,training1$classe)
predictions2 <- predict(fit, newdata=testing)
confusionMatrix(predictions2,testing$classe)
###prediction of class in the test data of 20 samples
predictions3 <- predict(fit, newdata=test)
summary(predictions3)
str(predictions3)
predictions3

