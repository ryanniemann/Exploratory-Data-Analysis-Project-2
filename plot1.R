#1.Have total emissions from PM2.5 decreased in the United States
#from 1999 to 2008? Using the base plotting system, make a plot 
#showing the total PM2.5 emission from all sources for each of 
#the years 1999, 2002, 2005, and 2008. 

#Read the data 
NEI <- readRDS("data/summarySCC_PM25.rds")
SCC <- readRDS("data/Source_Classification_Code.rds")

#Total PM2.5 emission from all sources 
#in 1999, 2002, 2005, and 2008
Total <- aggregate(Emissions ~ year,NEI, sum) 

#Plot the total PM2.5 for each year 
barplot((Total$Emissions)/10^6,
        names.arg=Total$year,
        xlab="Year",
        ylab="Amount of PM2.5 Emitted in Tons",
        main="Total Emissions from PM2.5 
United States - All sources"
        )
