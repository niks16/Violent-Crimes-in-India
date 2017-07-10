#This function prints (on the console) the top 3 states for each crime(Robbery, Arson, Riots and Dowry Deaths) based on the predicted results
#And finally prints (on the console) the top 3 states with most violent crimes in India

#Setting the path to the Output Folder
setwd("C:/Users/Nikshubha/Documents/R/Project/Output")

#Results of Robbery Cases
df.robbery<-read.csv("Robbery.txt")
df.robbery<-df.robbery[order(df.robbery$X2015,decreasing = TRUE),]
print(head(df.robbery))
PrintStatement1 <-paste("In Robbery cases:",df.robbery[1,1],"tops all the states/UTs in India")
PrintStatement2<- paste("and is followed by",df.robbery[2,1],df.robbery[3,1],"respectively")
print(PrintStatement1)
print(PrintStatement2)

#Results of Riot Cases
df.riots<-read.csv("Riots.txt")
df.riots<-df.riots[order(df.riots$X2015,decreasing = TRUE),]
print(head(df.riots))
PrintStatement1 <- paste("In Riot cases:",df.riots[1,1],"tops all the states/UTs in India")
PrintStatement2<- paste("and is followed by",df.riots[2,1],df.riots[3,1],"respectively")
print(PrintStatement1)
print(PrintStatement2)

#Results of Arson Cases
df.arson<-read.csv("Arson.txt")
df.arson<-df.arson[order(df.arson$X2015,decreasing = TRUE),]
print(head(df.robbery))
PrintStatement1 <- paste("In Arson cases:",df.arson[1,1],"tops all the states/UTs in India")
PrintStatement2<- paste("and is followed by",df.arson[2,1],df.arson[3,1],"respectively")
print(PrintStatement1)
print(PrintStatement2)

#Results of Dowry Death Cases
df.dd<-read.csv("DowryDeath.txt")
df.dd<-df.dd[order(df.dd$X2015,decreasing = TRUE),]
print(head(df.dd))
PrintStatement1 <- paste("In Dowry Death cases:",df.dd[1,1],"tops all the states/UTs in India")
PrintStatement2<- paste("and is followed by",df.dd[2,1],df.dd[3,1],"respectively")
print(PrintStatement1)
print(PrintStatement2)

#Results of Violent Crime
df.totalcrime<-read.csv("Total Crime Predicted.txt")
df.totalcrime<-df.totalcrime[order(df.totalcrime$X2015,decreasing = TRUE),]
print(head(df.totalcrime))
PrintStatement1 <- paste("Total Violent Crime cases:",df.totalcrime[1,2],"tops all the states/UTs in India")
PrintStatement2<- paste("and is followed by",df.totalcrime[2,2],df.totalcrime[3,2],"respectively")
print(PrintStatement1)
print(PrintStatement2)
