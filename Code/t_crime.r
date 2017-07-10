#This function creates the DataSets used for Choropleth map 
#It sums up the no. of crimes over the years 2004-2014
#Also sums up the total no. of crimes for each of the predicted years

#Library required:
library(readxl)

#Setting up the path
setwd("C:/Users/Nikshubha/Documents/R/Project/Output")

#Predicted Crimes
Rbdata1<-read.csv("Robbery.txt")
Ridata1<-read.csv("Riots.txt")
Ardata1<-read.csv("Arson.txt")
Dwdata1<-read.csv("DowryDeath.txt")

#Available Data (Previous Years)
Rbdata2 <- read_excel("~/R/Project/DataSets/Robbery.xlsx")
Ridata2 <- read_excel("~/R/Project/DataSets/Riots.xlsx")
Ardata2 <- read_excel("~/R/Project/DataSets/Arson.xlsx")
Dwdata2 <- read_excel("~/R/Project/DataSets/DowryDeaths.xlsx")
indiacrime.predicted<-data.frame()
indiacrime.previous<-data.frame()

for(i in c(1:35))
{
indiacrime.predicted[i,1]<-as.character(Rbdata1[i,1])
indiacrime.predicted[i,2]<-round(sum(Rbdata1[i,2],Ridata1[i,2],Ardata1[i,2],Dwdata1[i,2]))
indiacrime.predicted[i,3]<-round(sum(Rbdata1[i,3],Ridata1[i,3],Ardata1[i,3],Dwdata1[i,3]))
indiacrime.predicted[i,4]<-round(sum(Rbdata1[i,4],Ridata1[i,4],Ardata1[i,4],Dwdata1[i,4]))
indiacrime.predicted[i,5]<-round(sum(Rbdata1[i,5],Ridata1[i,5],Ardata1[i,5],Dwdata1[i,5]))
indiacrime.previous[i,1]<-as.character(Rbdata2[i,2])
indiacrime.previous[i,2]<-sum(Rbdata2[i,c(3:13)],Ridata2[i,c(3:13)],Ardata2[i,c(3:13)],Dwdata2[i,c(3:13)])

}
colnames(indiacrime.predicted)<-c("STATE.UT",'2015','2016','2017','2018')
colnames(indiacrime.previous)<-c("STATE.UT","TOTAL CRIME")

#Saving the files created
write.csv(indiacrime.predicted, file = "c:/Users/Nikshubha/Documents/R/Project/Output/Total Crime Predicted.txt")
write.csv(indiacrime.previous, file = "c:/Users/Nikshubha/Documents/R/Project/Output/Total Crime Previous Years.txt")