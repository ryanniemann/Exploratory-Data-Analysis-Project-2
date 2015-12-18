#6.Compare emissions from motor vehicle sources in Baltimore City
#with emissions from motor vehicle sources in Los Angeles County, 
#California (fips == "06037"). Which city has seen greater 
#changes over time in motor vehicle emissions?

#Read the data 
NEI <- readRDS("data/summarySCC_PM25.rds")
SCC <- readRDS("data/Source_Classification_Code.rds")

#Subset the motor vehicles
vehicles <- grepl("vehicle", SCC$SCC.Level.Two, ignore.case=TRUE)
vehiclesSCC <- SCC[vehicles,]$SCC
vehiclesNEI <- NEI[NEI$SCC %in% vehiclesSCC,]

#Subset the motor vehicles for 
#Baltimore City, Maryland (fips "24510")
baltimoreVehiclesNEI <- vehiclesNEI[vehiclesNEI$fips=="24510",] 
baltimoreVehiclesNEI$city <- "Baltimore City, Maryland"

#Subset the motor vehicles for 
#Los Angeles County, California (fips "06037") 
vehiclesLANEI <- vehiclesNEI[vehiclesNEI$fips=="06037",]
vehiclesLANEI$city <- "Los Angeles County, California"

#Combine 
combinedData <- rbind(baltimoreVehiclesNEI, vehiclesLANEI)

#Create plot 
library(ggplot2)
ggp <- ggplot(combinedData, aes(x=factor(year), y=Emissions, fill=city)) +
        geom_bar(stat="identity") +
        facet_grid(scales="free", space="free", .~city) +
        guides(fill=FALSE) + theme_bw() +
        labs(x="Year", y=expression("Amount of PM2.5 Emitted in Tons")) + 
        ggtitle("
Total Emissions from PM2.5 
Motor Vehicle Sources")
print(ggp)