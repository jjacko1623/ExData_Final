##Plot 2 code

#set wd
#setwd("C:/Users/jjack_000/Desktop/Data Science JH course/Exploratory Data Analysis")
setwd("C:/Users/Sophy/Desktop/JJ Coursera/Exploratory Data/ExData_Final")

##read in data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

##Plot 2
yearsData <- unique(NEI$year)
baltData <- subset(NEI,fips == "24510")

totBaltEmm99 <- sum(baltData$Emissions[baltData$year == 1999])
totBaltEmm02 <- sum(baltData$Emissions[baltData$year == 2002])
totBaltEmm05 <- sum(baltData$Emissions[baltData$year == 2005])
totBaltEmm08 <- sum(baltData$Emissions[baltData$year == 2008])

totBaltEmm <- c(totBaltEmm99,totBaltEmm02,totBaltEmm05,totBaltEmm08)

plot(yearsData,totBaltEmm,xlab = "Year",ylab = "Total Emmissions",xaxt="n")
axis(1,at = yearsData,labels = T)
bestBaltFit <- lm(totBaltEmm ~ yearsData)
abline(bestBaltFit, lwd=1.5)

dev.copy(png,'Plot2.png')
dev.off
