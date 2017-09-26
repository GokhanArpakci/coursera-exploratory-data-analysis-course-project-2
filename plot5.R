NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

library(ggplot2)

# How have emissions from motor vehicle sources changed from 1999-2008 in Baltimore City?

# 24510 is Baltimore, see plot2.R
# Searching for ON-ROAD type in NEI
# Don't actually know it this is the intention, but searching for 'motor' in SCC only gave a subset (non-cars)
subsetNEI5 <- NEI[NEI$fips=="24510" & NEI$type=="ON-ROAD",  ]

aggregatedTotalByYear5 <- aggregate(Emissions ~ year, subsetNEI5, sum)
  

png("plot5.png", width=840, height=480)
g3 <- ggplot(aggregatedTotalByYear, aes(factor(year), Emissions))
g3 <- g3 + geom_bar(stat="identity") +
  xlab("year") +
  ylab(expression('Total PM'[2.5]*" Emissions")) +
  ggtitle('Total Emissions from motor vehicle (type = ON-ROAD) in Baltimore City, Maryland (fips = "24510") from 1999 to 2008')
print(g3)
dev.off()
