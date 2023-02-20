library(readxl)
dataset1 = read_excel("D:\\Excel File\\IrisData.xls")
View(dataset1)
nrow(dataset1)

dataset1 = as.data.frame(dataset1)
class(dataset1)
summary(dataset1)

x=dataset1$SepalLengthCm
y=dataset1$SepalWidthCm
library(ggplot2)
ggplot(dataset1,aes(SepalLengthCm,y=SepalWidthCm,col=Species))+geom_point()
ggplot(dataset1,aes(PetalLengthCm,y=PetalWidthCm,col=Species))+geom_point()

dataset1_1=dataset1[,2:5]
tot_wss=c()
for(i in 1:15) 
{
p=kmeans(dataset1_1,centers=i)
tot_wss[i]=p$tot.withinss
}
tot_wss
plot(x=1:15,y=tot_wss,type="b",xlab="Number of ClusterS",ylab="within groups")

dataset1_2=data.frame(x,y)
dataset1_2
p=kmeans(dataset1_2,centers=3)
plot(x,y,col=p$cluster,pch=19)
points(p$centers,col=1:3,pch=4,cex=3,lwd=4)
