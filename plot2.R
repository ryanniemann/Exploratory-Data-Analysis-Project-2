#2.Have total emissions from PM2.5 decreased in 
#the Baltimore City, Maryland (fips == "24510") 
#from 1999 to 2008? Use the base plotting system 
#to make a plot answering this question. 

#Read the data 
NEI <- readRDS("data/summarySCC_PM25.rds")
SCC <- readRDS("data/Source_Classification_Code.rds")

#Total PM2.5 emission for Baltimore City, Maryland
#(fips="24510") from 1999 to 2008 
BaltimoreNEI <- NEI[NEI$fips=="24510",]
TotalBaltimore <- aggregate(Emissions ~ year, BaltimoreNEI, sum)

#Plot the total PM2.5 for each year 
barplot(TotalBaltimore$Emissions,
        names.arg=TotalBaltimore$year,
        xlab="Year",
        ylab="Amount of PM2.5 Emitted in Tons",
        main="Total Emissions from PM2.5
Baltimore City, Maryland"
)