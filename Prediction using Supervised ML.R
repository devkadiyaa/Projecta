library(readxl)
dataset = read_excel("D:\\Excel File\\MLData.xlsx")
View(dataset)
nrow(dataset)

dataset = as.data.frame(dataset)
class(dataset)

library(rpart)
library(dplyr)
library(caTools)

plot(dataset)
split_values<-sample.split(dataset$Scores,SplitRatio = 0.9)

train_sample<-subset(dataset,split_values==T)
nrow(train_sample)
test_sample<-subset(dataset,split_values==F)
nrow(test_sample)

plot(dataset)
y=dataset$Scores
x=dataset$Hours
model<-lm(y~x)
print(summary(model))

result=predict(object=model, newdata=test_sample)
result

z=data.frame(pred=result,actual=dataset$Scores)
z
mse=sqrt(mean(z$actual-z$pred)^2)
mse

a=data.frame(x=9.25)
final_result=predict(model,a)
final_result
