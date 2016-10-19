##Plot 6 code


#set wd
setwd("C:/Users/jjack_000/Desktop/Data Science JH course/Exploratory Data Analysis/ExData_FinalRepo")
#setwd("C:/Users/Sophy/Desktop/JJ Coursera/Exploratory Data/ExData_Final")

##read in data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

##Plot 6

#plot both Balt data and cali data

yearsData <- unique(NEI$year)

#filter by Baltimore and On-road
baltData <- subset(NEI,fips == "24510")
RbaltData <- subset(baltData,type == "ON-ROAD")

totBaltEmm99 <- sum(RbaltData$Emissions[RbaltData$year == 1999])
totBaltEmm02 <- sum(RbaltData$Emissions[RbaltData$year == 2002])
totBaltEmm05 <- sum(RbaltData$Emissions[RbaltData$year == 2005])
totBaltEmm08 <- sum(RbaltData$Emissions[RbaltData$year == 2008])

totBaltEmm <- c(totBaltEmm99,totBaltEmm02,totBaltEmm05,totBaltEmm08)

#filter by California and On-road
calData <- subset(NEI,fips == "06037")
RcalData <- subset(calData,type == "ON-ROAD")

totCalEmm99 <- sum(RcalData$Emissions[RcalData$year == 1999])
totCalEmm02 <- sum(RcalData$Emissions[RcalData$year == 2002])
totCalEmm05 <- sum(RcalData$Emissions[RcalData$year == 2005])
totCalEmm08 <- sum(RcalData$Emissions[RcalData$year == 2008])

totCalEmm <- c(totCalEmm99,totCalEmm02,totCalEmm05,totCalEmm08)

yticksBalt <- seq(0,400,100)
yticksCal <- seq(3500,4500,200)

par(mfrow = c(1,2))
plot(yearsData,totBaltEmm,xlab = "Year",ylab = "Total Emmissions",xaxt="n",col = "red")
axis(1,at = yearsData,labels = T)
axis(2,at = yticksBalt,labels = yticksBalt)
plot(yearsData,totCalEmm,xlab = "Year",ylab = "Total Emmissions",xaxt="n",col = "blue")
axis(1,at = yearsData,labels = T)
axis(2,at = yticksCal,labels = yticksCal)


png(file='Plot6.png',width = 480,height = 480)
dev.off
