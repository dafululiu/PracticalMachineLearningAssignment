#import training and testing data
training<-read.csv("C:\\Users\\jliu28\\Downloads\\pml-training.csv", header=TRUE)
testing<-read.csv("C:\\Users\\jliu28\\Downloads\\pml-testing.csv", header=TRUE)
#load necessary library
library(rpart) 
#install.packages('randomForest') 
library(randomForest) 
#install.packages('party') 
library(party) 
library(caret)
modFit<-train(training$classe~., methods="rf", data=training)
print(modFit$finalModel)
