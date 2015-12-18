#5.How have emissions from motor vehicle sources changed 
#from 1999-2008 in Baltimore City? 

#Read the data 
NEI <- readRDS("data/summarySCC_PM25.rds")
SCC <- readRDS("data/Source_Classification_Code.rds")

#Subset the motor vehicles
vehicles <- grepl("vehicle", SCC$SCC.Level.Two, ignore.case=TRUE)
vehiclesSCC <- SCC[vehicles,]$SCC
vehiclesNEI <- NEI[NEI$SCC %in% vehiclesSCC,]

#Subset the motor vehicles for 
#Baltimore City, Maryland (fips="24510")
baltimoreVehiclesNEI <- vehiclesNEI[vehiclesNEI$fips==24510,] 

#Create plot 
library(ggplot2)
ggp <- ggplot(baltimoreVehiclesNEI,aes(factor(year),Emissions)) +
        geom_bar(stat="identity",fill="grey",width=0.75) +
        theme_bw() +  guides(fill=FALSE) +
        labs(x="Year", y=expression("Amount of PM2.5 Emitted in Tons")) + 
        ggtitle("
        Total Emissions from PM2.5
Baltimore City, Maryland - Motor Vehicle Sources")
print(ggp)
