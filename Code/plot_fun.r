#The main function (plot.graph) that creates Linear regression plots for all 27 states and 7 UTs

plot.graph<- function(indiacrime, row, crime) {
  year <- c(2004:2014)
  thecrime <- as.numeric(indiacrime[row,c(3:13)])
  state=indiacrime[row,2]
  # Calculate the minimum and maximum, for enhancing graph scale and readability
  ymin <- min(thecrime) - 300
  ymax <- max(thecrime) + 500
 
   if(ymin<0)
  { ymin=0
   }
  
  # Make seperate folders for each state
  path<-paste("C:/Users/Nikshubha/Documents/R/Project/Graphs/",state)
  
    if(!file.exists(path)) {
      dir.create(path)
    }
  
  #Set path to the folder created
  setwd(path)
  crimeplot <- paste(crime,".jpg")
  jpeg(crimeplot)
  
  # Plot the details of the crime
  plot(year, thecrime, pch= 15, col="red", xlab = "Year", ylab=crime,
       xlim=c(2004,2018),ylim=c(ymin,ymax))
  
  # Fit a linear regression model
  lmfit <-lm(thecrime~year)
  
  # Draw the lmfit line
  abline(lmfit)
  
  # Calculate the projected incidents of the crime
  nyears <-c(2015:2018)
  #Initializing all initial predicted values to 0
  nthecrime <- rep(0,length(nyears))
  
  # Projected crime incidents from 2015 to 2018 using a linear regression model
  for (i in seq_along(nyears)) {
    nthecrime[i] <- lmfit$coefficients[2] * nyears[i] + lmfit$coefficients[1]
    
  }
  
  # Add the legend/key
  alegend <- paste(
    "Projected ",crime, " in ", indiacrime[row,2])
  points(nyears,nthecrime,pch= 17, col="blue")
  legend( x="topleft", legend=c(alegend), col=c("blue"), bty="n" , lwd=1, lty=c(2), pch=17 )
  
  #Save the plot in jpeg format
  dev.off()
  
  #Change directory to the one level back
  setwd("..")
  
  # Write the projected crime rate in a file
  path<-"C:/Users/Nikshubha/Documents/R/Project/Output/"
  setwd(path)
  filename <- paste(crime,".txt",sep = "")
  if(!file.exists(filename))
  {
    file.create(filename)
    cat(as.character(c("STATE/UT",nyears)), file=filename, append = TRUE, sep = ",", eol = "\n")
  }
  
  for(i in c(1:4)){
    nthecrime[i]=round(nthecrime[i],2);
  }
  value<-c(state,nthecrime)
  cat(as.character(value), file=filename, append = TRUE, sep = ",", eol = "\n")
  
  #Come back up one level
  setwd("..")
  
 }

#Calling the function for all 4 types of Crime
for(i in c(1:35))
{ plot.graph(Robbery,i,"Robbery")
  plot.graph(Riots,i,"Riots")
  plot.graph(Arson,i,"Arson")
  plot.graph(DowryDeaths,i,"DowryDeath")
}
