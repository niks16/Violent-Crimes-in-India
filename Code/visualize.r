#This function creates the choropleth maps of India
#It creates 2 maps, one which shows the no. of violent crimes over the years 2004-2014 and the other predicts it for the year 2017

#Libraries Required:
library(sp)
library(ggplot2)
library(maptools)

#Choropleth Map for 2017
#Setting up the path for DataSets:
setwd("C:/Users/Nikshubha/Documents/R/Project/Output")
crimedata<-read.csv("Total Crime Predicted.txt")

#Creating a DataFrame for the specific column required: 
crimedata<-crimedata[,c(2,5)]

#Loading the map(SHP format)
india <- readShapeSpatial("C:/Users/Nikshubha/Documents/R/Project/map/map.shp")

#Changing specific cells to match with the data present in map
crimedata[,1]<-tolower(crimedata[,1])
crimedata[10,1] <- as.character("jammu and kashmir")
crimedata[29,1] <-as.character("andaman and nicobar")
crimedata[31,1]<- as.character("dadra and nagar haveli")
crimedata[32,1]<- as.character("daman and diu")
crimedata[35,1]<- as.character("puducherry")

#Filling in information in the map data to get the Choropleth Map
india@data = data.frame(india@data, crimedata[match(tolower(india@data$NAME_1), crimedata$STATE.UT),])

#Changing the directory to save the plot
setwd("C:/Users/Nikshubha/Documents/R/Project")
crimeplot <- paste("Violent Crime",".jpg")
jpeg(crimeplot,width=1000,height = 1000)
title<- "Total Violent Crime(Robbery, Riots, Arson, Dowry Death) in India in 2017"
#Plotting the map using spplot
spplot(india, "X2017", col.regions=topo.colors(35), main=title)
#Saving the jpeg image
dev.off()


#Choropleth Map for years 2004-2014
#Setting up the path for DataSets:
setwd("C:/Users/Nikshubha/Documents/R/Project/Output")
crimedata<-read.csv("Total Crime Previous Years.txt")

#Creating a DataFrame for the specific column required: 
crimedata<-crimedata[,c(2,3)]

#Loading the map(SHP format)
india <- readShapeSpatial("C:/Users/Nikshubha/Documents/R/Project/map/map.shp")

#Changing specific cells to match with the data present in map
crimedata[,1]<-tolower(crimedata[,1])
crimedata[10,1] <- as.character("jammu and kashmir")
crimedata[29,1] <-as.character("andaman and nicobar")
crimedata[31,1]<- as.character("dadra and nagar haveli")
crimedata[32,1]<- as.character("daman and diu")
crimedata[35,1]<- as.character("puducherry")

#Filling in information in the map data to get the Choropleth Map
india@data = data.frame(india@data, crimedata[match(tolower(india@data$NAME_1), crimedata$STATE.UT),])

#Changing the directory to save the plot
setwd("C:/Users/Nikshubha/Documents/R/Project")
crimeplot <- paste("Violent Crime Previous Years",".jpg")
jpeg(crimeplot,width=1000,height = 1000)
title<- "Total Violent Crime(Robbery, Riots, Arson, Dowry Death) in India over the years 2004-2014"
#Plotting the map using spplot
spplot(india, "TOTAL.CRIME", col.regions=topo.colors(35), main=title)
#Saving the jpeg image
dev.off()