library(ggplot2)
nei<-readRDS("Source_Classification_Code.rds")
scc<-readRDS("summarySCC_PM25.rds")
vehicle<-nei[grepl("*Vehicles",nei[["EI.Sector"]]),]
scc1<-scc[scc$SCC %in% vehicle$SCC ,]
scc2<-subset(scc1,scc1$fips=="24510")
png("plot5.png",width=480,height=480)
qplot(Emissions,data=scc2,facets=year~.,binwidth=2)
dev.off()
