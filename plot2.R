NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#Plot 2
SubsetNEI2<-NEI[NEI$fips=="24510",]
aggregatedTotalByYear2<-aggregate(Emissions ~ year,SubsetNEI2,sum)
png('plot2.png')

barplot(height=aggregatedTotalByYear$Emissions, names.arg=aggregatedTotalByYear$year, xlab="years", ylab=expression('total PM'[2.5]*' emission'),main=expression('Total PM'[2.5]*' in the Baltimore City, MD emissions at various years'))
dev.off()
