#link for assign.
https://courses.edx.org/courses/course-v1:MITx+15.071x_3+1T2016/courseware/f8d71d64418146f18a066d7f0379678c/60d93a44280348d7a0a16663f92af0f7/?child=first

#add file
getwd()
train = read.csv("pisa2009train.csv")
test = read.csv("pisa2009test.csv")

#to get variables
names(train)

#use str to get no. of obsevations
str(train)

#subset fr male and female
m = subset(train,male==1)
f = subset(train,male==0)

# u can directle get average score by using tapply fnc. 
a = tapply(train$readingScore,train$male==1,mean)

#to get missing data use summary 
summary(train)


# remove missing data 
rtrain = na.omit(train)
rtest = na.omit(test)

#no. of observaton remained
str(rtrain)
str(rtest)

#to get no. of student per raceeth
summary(rtrain$raceeth)

#seeting reference level to white
train$raceeth = relevel(train$raceeth, "White")
test$raceeth = relevel(test$raceeth, "White")

#model by taking all ind. var.
model1 = lm(readingScore~.,data=train)
summary(model1)

# calculating root-mean squared error (RMSE)
sse = sum(model1$residuals^2)
rmse = sqrt(sse/nrow(rtrain))
rmse

# use predict function to get relatio in test dateset
predict1 = predict(model1,newdata=rtest)
summary(predict1)

# calculation for r2 for test dataset
sse1 = sum((predict1 - rtest$readingScore)^2)
rmse1 = sqrt(sse1/nrow(rtest))
sse1
rmse1

avg = mean(rtrain$readingScore)
avg

r2 = 1 - sse1/sst1
r2

