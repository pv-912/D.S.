# link for assign.
https://courses.edx.org/courses/course-v1:MITx+15.071x_3+1T2016/courseware/f8d71d64418146f18a066d7f0379678c/60d93a44280348d7a0a16663f92af0f7/?child=first

# add file 
getwd()
a = read.csv("climate_change.csv")

#suumary of dataset
summary(a)

#subset for train and test
train = subset(a,Year<=2006)
test=subset(a,Year>2006)

#linear regression model using all indep. vari.
model1 = lm(Temp ~ MEI+ CO2+ CH4+ N2O+ CFC.11+ CFC.12+ TSI+ Aerosols, data = train)
summary(model1)

#correlation b/w all varia.
cor(train)

#model after elimination less corr. varia.
model2 = lm(Temp ~ MEI+ N2O+ TSI+ Aerosols, data = train)
summary(model2)

#model using step function
model3 = step(model1)
summary(model3)

#predict function to relate test data to the step functioned model
predict2 = predict(model3,newdata=test)

# calculation of R^2
sse = sum((predict2 - test$Temp)^2)
sst = sum((mean(train$Temp) - test$Temp)^2)
R2 = 1 - sse/sst
R2



