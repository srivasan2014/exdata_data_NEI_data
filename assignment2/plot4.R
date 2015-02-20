library(ggplot2)
nei<-readRDS("Source_Classification_Code.rds")
scc<-readRDS("summarySCC_PM25.rds")
coal<-nei[grepl("Fuel Comb.*Coal", nei$EI.Sector),]
scc<-scc[scc$SCC %in% coal$SCC,]
png("plot4.png",width=480,height=480)
qplot(year,Emissions,data=scc,facets=.~type,color=type)
dev.off()
