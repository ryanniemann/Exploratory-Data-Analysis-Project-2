#4. Across the United States, how have emissions 
#from coal combustion-related sources changed from 1999-2008?

#Read the data 
NEI <- readRDS("data/summarySCC_PM25.rds")
SCC <- readRDS("data/Source_Classification_Code.rds")

#Subset coal combustion related NEI data and total by year 
CombustionL1 <- SCC[grep("Combustion",SCC$SCC.Level.One),]
CoaldataL3 <- CombustionL1[grep("Coal",CombustionL1$SCC.Level.Three),]
Total3 <- NEI[NEI$SCC %in% CoaldataL3$SCC,]
Year3 <- unique(Total3$year)
Total3 <- c(sum(Total3$Emissions[which(Total3$year == 1999)]),sum(Total3$Emissions[which(Total3$year == 2002)]),sum(Total3$Emissions[which(Total3$year == 2005)]),sum(Total3$Emissions[which(Total3$year == 2008)]))

#Create plot 
Info3 <- data.frame(Total = Total3,Year = as.factor(Year3))
ggplot(data=Info3, aes(x=Year, y=Total/10^5)) + 
        geom_bar(stat="identity", fill="grey",width=0.75) + 
        theme_bw() +  guides(fill=FALSE) +
        labs(x="Year", y=expression("Amount of PM2.5 Emitted in Tons")) + 
        ggtitle("
        Total Emissions from PM2.5
United States - Coal Combustion Sources")

