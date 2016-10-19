##Plot 4 code


#set wd
setwd("C:/Users/jjack_000/Desktop/Data Science JH course/Exploratory Data Analysis/ExData_FinalRepo")
#setwd("C:/Users/Sophy/Desktop/JJ Coursera/Exploratory Data/ExData_Final")

##read in data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

##Plot 4

#trim SCC data as will save on merge
trimSCC <- SCC[,c(1,3)]

#merge data
mData <- merge(NEI,trimSCC, by = c("SCC"), all.x = T)

#check in short name for coal
CoalItems <- grep("Coal",mData$Short.Name)

coalData <- mData[CoalItems,]

yearsData <- unique(NEI$year)

totEmm99 <- sum(coalData$Emissions[coalData$year == 1999])
totEmm02 <- sum(coalData$Emissions[coalData$year == 2002])
totEmm05 <- sum(coalData$Emissions[coalData$year == 2005])
totEmm08 <- sum(coalData$Emissions[coalData$year == 2008])

totEmm <- c(totEmm99,totEmm02,totEmm05,totEmm08)


yticks <- seq(350000,650000,100000)
plot(yearsData,totEmm,xlab = "Year",ylab = "Total Emmissions",xaxt="n")
axis(1,at = yearsData,labels = T)
axis(2,at = yticks,labels = yticks)
bestFit <- lm(totEmm ~ yearsData)
abline(bestFit, lwd=1.5)

png(file='Plot4.png',width=480,height=480)
dev.off
