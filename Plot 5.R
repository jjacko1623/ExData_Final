##Plot 5 code


#set wd
setwd("C:/Users/jjack_000/Desktop/Data Science JH course/Exploratory Data Analysis/ExData_FinalRepo")
#setwd("C:/Users/Sophy/Desktop/JJ Coursera/Exploratory Data/ExData_Final")

##read in data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

##Plot 5

yearsData <- unique(NEI$year)

#filter by Baltimore and On-road
baltData <- subset(NEI,fips == "24510")
RbaltData <- subset(baltData,type == "ON-ROAD")

totEmm99 <- sum(RbaltData$Emissions[RbaltData$year == 1999])
totEmm02 <- sum(RbaltData$Emissions[RbaltData$year == 2002])
totEmm05 <- sum(RbaltData$Emissions[RbaltData$year == 2005])
totEmm08 <- sum(RbaltData$Emissions[RbaltData$year == 2008])

totEmm <- c(totEmm99,totEmm02,totEmm05,totEmm08)

yticks <- seq(0,400,100)
plot(yearsData,totEmm,xlab = "Year",ylab = "Total Emmissions",xaxt="n")
axis(1,at = yearsData,labels = T)
axis(2,at = yticks,labels = yticks)
bestFit <- lm(totEmm ~ yearsData)
abline(bestFit, lwd=1.5)


png(file='Plot5.png',width = 480,height = 480)
dev.off
