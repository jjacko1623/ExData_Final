##Plot 1 code

#set wd
#setwd("C:/Users/jjack_000/Desktop/Data Science JH course/Exploratory Data Analysis")
setwd("C:/Users/Sophy/Desktop/JJ Coursera/Exploratory Data/ExData_Final")

##read in data
#NEI <- readRDS("summarySCC_PM25.rds")
#SCC <- readRDS("Source_Classification_Code.rds")

##Plot 1
yearsData <- unique(NEI$year)

totEmm99 <- sum(NEI$Emissions[NEI$year == 1999])
totEmm02 <- sum(NEI$Emissions[NEI$year == 2002])
totEmm05 <- sum(NEI$Emissions[NEI$year == 2005])
totEmm08 <- sum(NEI$Emissions[NEI$year == 2008])

totEmm <- c(totEmm99,totEmm02,totEmm05,totEmm08)

plot(yearsData,totEmm,xlab = "Year",ylab = "Total Emmissions",xaxt="n")
axis(1,at = yearsData,labels = T)
bestFit <- lm(totEmm ~ yearsData)
abline(bestFit, lwd=1.5)

dev.copy(png,'Plot1.png')
dev.off

##So the total emmissions appears to be decreasing
##This may be due to a number of things such as fewer recordings, not just the obvious result of lower emmissions
