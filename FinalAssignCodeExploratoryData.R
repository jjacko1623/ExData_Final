##Final assignment - Exploratory data

#set wd
#setwd("C:/Users/jjack_000/Desktop/Data Science JH course/Exploratory Data Analysis")
setwd("C:/Users/Sophy/Desktop/JJ Coursera/Exploratory Data/ExData_Final")

##read in data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

##Plot 1
#yearsData <- unique(NEI$year)

#totEmm99 <- sum(NEI$Emissions[NEI$year == 1999])
#totEmm02 <- sum(NEI$Emissions[NEI$year == 2002])
#totEmm05 <- sum(NEI$Emissions[NEI$year == 2005])
#totEmm08 <- sum(NEI$Emissions[NEI$year == 2008])

#totEmm <- c(totEmm99,totEmm02,totEmm05,totEmm08)

#plot(yearsData,totEmm,xlab = "Year",ylab = "Total Emmissions",xaxt="n")
#axis(1,at = yearsData,labels = T)
#bestFit <- lm(totEmm ~ yearsData)
#abline(bestFit, lwd=1.5)

##So the total emmissions appears to be decreasing
##This may be due to a number of things such as fewer recordings, not just the obvious result of lower emmissions


##Plot 2
#yearsData <- unique(NEI$year)
#baltData <- subset(NEI,fips == "24510")

#totBaltEmm99 <- sum(baltData$Emissions[baltData$year == 1999])
#totBaltEmm02 <- sum(baltData$Emissions[baltData$year == 2002])
#totBaltEmm05 <- sum(baltData$Emissions[baltData$year == 2005])
#totBaltEmm08 <- sum(baltData$Emissions[baltData$year == 2008])

#totBaltEmm <- c(totBaltEmm99,totBaltEmm02,totBaltEmm05,totBaltEmm08)

#plot(yearsData,totBaltEmm,xlab = "Year",ylab = "Total Emmissions",xaxt="n")
#axis(1,at = yearsData,labels = T)
#bestBaltFit <- lm(totBaltEmm ~ yearsData)
#abline(bestBaltFit, lwd=1.5)

##So the total emmissions appears to be decreasing
##This may be due to a number of things such as fewer recordings, not just the obvious result of lower emmissions

##Plot 3
##assume decrease in emmissions means decrease in total emmissions, not average for example

#yearsData <- unique(NEI$year)
#baltData <- subset(NEI,fips == "24510")

#should use loop for ease, but taking no-brainer approach today
#totPBaltEmm99 <- sum(baltData$Emissions[baltData$year == 1999 | baltData$type == "POINT"])
#totNPBaltEmm99 <- sum(baltData$Emissions[baltData$year == 1999 | baltData$type == "NONPOINT"])
#totRBaltEmm99 <- sum(baltData$Emissions[baltData$year == 1999 | baltData$type == "ON-ROAD"])
#totNRBaltEmm99 <- sum(baltData$Emissions[baltData$year == 1999 | baltData$type == "NON-ROAD"])

#totPBaltEmm02 <- sum(baltData$Emissions[baltData$year == 2002 | baltData$type == "POINT"])
#totNPBaltEmm02 <- sum(baltData$Emissions[baltData$year == 2002 | baltData$type == "NONPOINT"])
#totRBaltEmm02 <- sum(baltData$Emissions[baltData$year == 2002 | baltData$type == "ON-ROAD"])
#totNRBaltEmm02 <- sum(baltData$Emissions[baltData$year == 2002 | baltData$type == "NON-ROAD"])

#totPBaltEmm05 <- sum(baltData$Emissions[baltData$year == 2005 | baltData$type == "POINT"])
#totNPBaltEmm05 <- sum(baltData$Emissions[baltData$year == 2005 | baltData$type == "NONPOINT"])
#totRBaltEmm05 <- sum(baltData$Emissions[baltData$year == 2005 | baltData$type == "ON-ROAD"])
#totNRBaltEmm05 <- sum(baltData$Emissions[baltData$year == 2005 | baltData$type == "NON-ROAD"])

#totPBaltEmm08 <- sum(baltData$Emissions[baltData$year == 2008 | baltData$type == "POINT"])
#totNPBaltEmm08 <- sum(baltData$Emissions[baltData$year == 2008 | baltData$type == "NONPOINT"])
#totRBaltEmm08 <- sum(baltData$Emissions[baltData$year == 2008 | baltData$type == "ON-ROAD"])
#totNRBaltEmm08 <- sum(baltData$Emissions[baltData$year == 2008 | baltData$type == "NON-ROAD"])

#totPBaltEmm <- c(totPBaltEmm99,totPBaltEmm02,totPBaltEmm05,totPBaltEmm08)
#totNPBaltEmm <- c(totNPBaltEmm99,totNPBaltEmm02,totNPBaltEmm05,totNPBaltEmm08)
#totRBaltEmm <- c(totRBaltEmm99,totRBaltEmm02,totRBaltEmm05,totRBaltEmm08)
#totNRBaltEmm <- c(totNRBaltEmm99,totNRBaltEmm02,totNRBaltEmm05,totNRBaltEmm08)



#totTypeBaltEmmYr <- rbind(totPBaltEmm,totNPBaltEmm,totRBaltEmm,totNRBaltEmm)
#rownames(totTypeBaltEmmYr) <- c("POINT", "NON-POINT", "ON-ROAD", "NON-ROAD")
#colnames(totTypeBaltEmmYr) <- c("1999","2002","2005","2008")

#cleanData <- as.data.frame(totTypeBaltEmmYr)

#typelist <- c("POINT","POINT","POINT","POINT","NONPOINT","NONPOINT","NONPOINT","NONPOINT","ON-ROAD","ON-ROAD","ON-ROAD","ON-ROAD","NON-ROAD","NON-ROAD","NON-ROAD","NON-ROAD")
#yearlist <- rep(c(1999,2002,2005,2008),4)
#totTypeBaltEmm <- c(totPBaltEmm,totNPBaltEmm,totRBaltEmm,totNRBaltEmm)

#totTypeYrBaltEmm <- cbind(typelist,yearlist,totTypeBaltEmm)
#colnames(totTypeYrBaltEmm) <- c("Type","Year","TotalEmmissions")

#totTypeYrBaltEmmDF <- as.data.frame(totTypeYrBaltEmm)

#library(ggplot2)
#library(gridExtra)

#build plot
#p99 <- qplot(yearsData,totPBaltEmm)
#p02 <- qplot(yearsData,totNPBaltEmm)
#p05 <- qplot(yearsData,totRBaltEmm)
#p08 <- qplot(yearsData,totNRBaltEmm)

#grid.arrange(p99,p02,p05,p08,cols=4)

#ggplot(totTypeYrBaltEmmDF,aes(Year,TotalEmmissions))+geom_point(color="aquamarine4")+facet_wrap(~Type,ncol=2) #+ scale_y_continuous(name="Total Emissions (per Type)",limits = c(2500, 8500))


##Plot 4

#trim SCC data as will save on merge
#trimSCC <- SCC[,c(1,3)]
  
#merge data
#mData <- merge(NEI,trimSCC, by = c("SCC"), all.x = T)

#check in short name for coal
#CoalItems <- grep("Coal",mData$Short.Name)

#coalData <- mData[CoalItems,]

#yearsData <- unique(NEI$year)

#totEmm99 <- sum(coalData$Emissions[coalData$year == 1999])
#totEmm02 <- sum(coalData$Emissions[coalData$year == 2002])
#totEmm05 <- sum(coalData$Emissions[coalData$year == 2005])
#totEmm08 <- sum(coalData$Emissions[coalData$year == 2008])

#totEmm <- c(totEmm99,totEmm02,totEmm05,totEmm08)


#yticks <- seq(350000,650000,100000)
#plot(yearsData,totEmm,xlab = "Year",ylab = "Total Emmissions",xaxt="n")
#axis(1,at = yearsData,labels = T)
#axis(2,at = yticks,labels = yticks)
#bestFit <- lm(totEmm ~ yearsData)
#abline(bestFit, lwd=1.5)

##So the total emmissions appears to be decreasing
##This may be due to a number of things such as fewer recordings, not just the obvious result of lower emmissions


##Plot 5

#yearsData <- unique(NEI$year)

#filter by Baltimore and On-road
#baltData <- subset(NEI,fips == "24510")
#RbaltData <- subset(baltData,type == "ON-ROAD")

#totEmm99 <- sum(RbaltData$Emissions[RbaltData$year == 1999])
#totEmm02 <- sum(RbaltData$Emissions[RbaltData$year == 2002])
#totEmm05 <- sum(RbaltData$Emissions[RbaltData$year == 2005])
#totEmm08 <- sum(RbaltData$Emissions[RbaltData$year == 2008])

#totEmm <- c(totEmm99,totEmm02,totEmm05,totEmm08)

#yticks <- seq(0,400,100)
#plot(yearsData,totEmm,xlab = "Year",ylab = "Total Emmissions",xaxt="n")
#axis(1,at = yearsData,labels = T)
#axis(2,at = yticks,labels = yticks)
#bestFit <- lm(totEmm ~ yearsData)
#abline(bestFit, lwd=1.5)

##So the total emmissions appears to be decreasing
##This may be due to a number of things such as fewer recordings, not just the obvious result of lower emmissions


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
