#3.Of the four types of sources indicated by the 
#type (point, nonpoint, onroad, nonroad) variable, 
#which of these four sources have seen decreases in 
#emissions from 1999-2008 for Baltimore City? 
#Which have seen increases in emissions from 1999-2008?  
#Use the ggplot2 plotting system to make a plot answer this question.

#Read the data 
NEI <- readRDS("data/summarySCC_PM25.rds")
SCC <- readRDS("data/Source_Classification_Code.rds")

#Emission for Baltimore City, Maryland
#(fips="24510") from 1999 to 2008 
BaltimoreNEI <- NEI[NEI$fips=="24510",] 

#Create plot 
library(ggplot2)

ggp <- ggplot(BaltimoreNEI,aes(factor(year),Emissions,fill=type)) +
        geom_bar(stat="identity") +
        theme_bw() + guides(fill=FALSE)+
        facet_grid(.~type,scales = "free",space="free") + 
        labs(x="Year", y=expression("Amount of PM2.5 Emitted in Tons")) + 
        labs(title=expression("
        Total Emissions from PM2.5
Baltimore City, Maryland by Source Type"))
print(ggp)