##Plot 3 code


#set wd
#setwd("C:/Users/jjack_000/Desktop/Data Science JH course/Exploratory Data Analysis")
setwd("C:/Users/Sophy/Desktop/JJ Coursera/Exploratory Data/ExData_Final")

##read in data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")


##Plot 3
##assume decrease in emmissions means decrease in total emmissions, not average for example

yearsData <- unique(NEI$year)
baltData <- subset(NEI,fips == "24510")

#should use loop for ease, but taking no-brainer approach today
totPBaltEmm99 <- sum(baltData$Emissions[baltData$year == 1999 | baltData$type == "POINT"])
totNPBaltEmm99 <- sum(baltData$Emissions[baltData$year == 1999 | baltData$type == "NONPOINT"])
totRBaltEmm99 <- sum(baltData$Emissions[baltData$year == 1999 | baltData$type == "ON-ROAD"])
totNRBaltEmm99 <- sum(baltData$Emissions[baltData$year == 1999 | baltData$type == "NON-ROAD"])

totPBaltEmm02 <- sum(baltData$Emissions[baltData$year == 2002 | baltData$type == "POINT"])
totNPBaltEmm02 <- sum(baltData$Emissions[baltData$year == 2002 | baltData$type == "NONPOINT"])
totRBaltEmm02 <- sum(baltData$Emissions[baltData$year == 2002 | baltData$type == "ON-ROAD"])
totNRBaltEmm02 <- sum(baltData$Emissions[baltData$year == 2002 | baltData$type == "NON-ROAD"])

totPBaltEmm05 <- sum(baltData$Emissions[baltData$year == 2005 | baltData$type == "POINT"])
totNPBaltEmm05 <- sum(baltData$Emissions[baltData$year == 2005 | baltData$type == "NONPOINT"])
totRBaltEmm05 <- sum(baltData$Emissions[baltData$year == 2005 | baltData$type == "ON-ROAD"])
totNRBaltEmm05 <- sum(baltData$Emissions[baltData$year == 2005 | baltData$type == "NON-ROAD"])

totPBaltEmm08 <- sum(baltData$Emissions[baltData$year == 2008 | baltData$type == "POINT"])
totNPBaltEmm08 <- sum(baltData$Emissions[baltData$year == 2008 | baltData$type == "NONPOINT"])
totRBaltEmm08 <- sum(baltData$Emissions[baltData$year == 2008 | baltData$type == "ON-ROAD"])
totNRBaltEmm08 <- sum(baltData$Emissions[baltData$year == 2008 | baltData$type == "NON-ROAD"])

totPBaltEmm <- c(totPBaltEmm99,totPBaltEmm02,totPBaltEmm05,totPBaltEmm08)
totNPBaltEmm <- c(totNPBaltEmm99,totNPBaltEmm02,totNPBaltEmm05,totNPBaltEmm08)
totRBaltEmm <- c(totRBaltEmm99,totRBaltEmm02,totRBaltEmm05,totRBaltEmm08)
totNRBaltEmm <- c(totNRBaltEmm99,totNRBaltEmm02,totNRBaltEmm05,totNRBaltEmm08)


totTypeBaltEmmYr <- rbind(totPBaltEmm,totNPBaltEmm,totRBaltEmm,totNRBaltEmm)
rownames(totTypeBaltEmmYr) <- c("POINT", "NON-POINT", "ON-ROAD", "NON-ROAD")
colnames(totTypeBaltEmmYr) <- c("1999","2002","2005","2008")

cleanData <- as.data.frame(totTypeBaltEmmYr)

typelist <- c("POINT","POINT","POINT","POINT","NONPOINT","NONPOINT","NONPOINT","NONPOINT","ON-ROAD","ON-ROAD","ON-ROAD","ON-ROAD","NON-ROAD","NON-ROAD","NON-ROAD","NON-ROAD")
yearlist <- rep(c(1999,2002,2005,2008),4)
totTypeBaltEmm <- c(totPBaltEmm,totNPBaltEmm,totRBaltEmm,totNRBaltEmm)

totTypeYrBaltEmm <- cbind(typelist,yearlist,totTypeBaltEmm)
colnames(totTypeYrBaltEmm) <- c("Type","Year","TotalEmmissions")

totTypeYrBaltEmmDF <- as.data.frame(totTypeYrBaltEmm)

library(ggplot2)
#library(gridExtra)

#build plot
#p99 <- qplot(yearsData,totPBaltEmm)
#p02 <- qplot(yearsData,totNPBaltEmm)
#p05 <- qplot(yearsData,totRBaltEmm)
#p08 <- qplot(yearsData,totNRBaltEmm)

#grid.arrange(p99,p02,p05,p08,cols=4)

ggplot(totTypeYrBaltEmmDF,aes(Year,TotalEmmissions))+geom_point(color="aquamarine4")+facet_wrap(~Type,ncol=2) #+ scale_y_continuous(name="Total Emissions (per Type)",limits = c(2500, 8500))

dev.copy(png,'Plot3.png')
dev.off
