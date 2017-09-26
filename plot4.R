NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

NEISCC<-merge(NEI,SCC,by="SCC")

library(ggplot2)

# Across the United States, how have emissions from coal combustion-related sources changed from 1999-2008?

# fetch all NEIxSCC records with Short.Name (SCC) Coal
coalMatches  <- grepl("coal", NEISCC$Short.Name, ignore.case=TRUE)
subsetNEISCC <- NEISCC[coalMatches, ]

head(subsetNEISCC)
aggregatedTotalByYear4<-aggregate(Emissions ~ year,subsetNEISCC,sum)
png("plot4.png",width = 640,height=480)
g2<-ggplot(aggregatedTotalByYear, aes(factor(year), Emissions))
g2<-g2+geom_bar(stat="identity") +
  xlab("year") +
  ylab(expression('Total PM'[2.5]*" Emissions")) +
  ggtitle('Total Emissions from coal sources from 1999 to 2008')
print(g2)
dev.off()
