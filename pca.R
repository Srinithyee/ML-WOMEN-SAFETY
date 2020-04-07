library(caTools)
library(caret)
library(e1071)


#data split and pre processing
set.seed(123)
split = sample.split(datasets$Class,SplitRatio = 0.75)
training_set = subset(datasets,split==TRUE)
test_set = subset(datasets,split==FALSE)


#common range
training_set[-9]=scale(training_set[-9])
test_set[-9]=scale(test_set[-9])


#model generation
pca = preProcess(x=training_set[-9],method = "pca",pcaComp = 2)


#using pca model to foresee the test and training sets
training_pca_set = predict(pca,training_set)
training_pca_set = training_pca_set[c(2,3,1)]
test_pca_set = predict(pca,test_set)
test_pca_set = test_pca_set[c(2,3,1)]