##Plot 1 code

#set wd
setwd("C:/Users/jjack_000/Desktop/Data Science JH course/Exploratory Data Analysis/ExData_FinalRepo")
#setwd("C:/Users/Sophy/Desktop/JJ Coursera/Exploratory Data/ExData_Final")

##read in data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

##Plot 1
yearsData <- unique(NEI$year)

totEmm99 <- sum(NEI$Emissions[NEI$year == 1999])
totEmm02 <- sum(NEI$Emissions[NEI$year == 2002])
totEmm05 <- sum(NEI$Emissions[NEI$year == 2005])
totEmm08 <- sum(NEI$Emissions[NEI$year == 2008])

totEmm <- c(totEmm99,totEmm02,totEmm05,totEmm08)


#build plot
plot(yearsData,totEmm,xlab = "Year",ylab = "Total Emmissions",xaxt="n")
axis(1,at = yearsData,labels = T)
bestFit <- lm(totEmm ~ yearsData)
abline(bestFit, lwd=1.5)

png(file='Plot1.png',width=480,height=480)
dev.off
