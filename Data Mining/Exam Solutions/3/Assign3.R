lensdata = read.csv("lenses.data.csv", header = FALSE, col.names = c("index", "age", "spectacle_prescription", "astigmatic", "tear_production_rate", "Class"))

lensdata$index <- NULL

library(rpart)
y<-as.factor(lensdata[,5])
x<-lensdata[,1:4]

model1<-rpart(y~.,x, parms = list(split = 'information'),
              control=rpart.control(minsplit=0,minbucket=0,cp=-1, maxcompete=0, maxsurrogate=0, usesurrogate=0, xval=0,maxdepth=5))


library(rpart.plot)
rpart.plot(model1)
gain <- sum(y==predict(model1,x,type="class"))/length(y)
gain
error_rate <- 1-sum(y==predict(model1,x,type="class"))/length(y)
error_rate