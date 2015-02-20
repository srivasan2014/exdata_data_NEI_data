setwd("/home/srivasan/exdata_data_NEI_data/assignment2")
library(ggplot2)
nei<-readRDS("Source_Classification_Code.rds")
scc<-readRDS("summarySCC_PM25.rds")
motor<-nei[grepl("*Vehicles",nei[["EI.Sector"]]),]
vehicle<-scc[scc[["SCC"]] %in% motor[["SCC"]],]
a1<-subset(vehicle[["Emissions"]],vehicle[["fips"]]=="24510" & vehicle[["year"]]==1999)
a2<-subset(vehicle[["Emissions"]],vehicle[["fips"]]=="24510" & vehicle[["year"]]==2002)
a3<-subset(vehicle[["Emissions"]],vehicle[["fips"]]=="24510" & vehicle[["year"]]==2005)
a4<-subset(vehicle[["Emissions"]],vehicle[["fips"]]=="24510" & vehicle[["year"]]==2008)
Baltimore<-list(sum(a1),sum(a2),sum(a3),sum(a4))
a5<-subset(vehicle[["Emissions"]],vehicle[["fips"]]=="06037" & vehicle[["year"]]==1999)
a6<-subset(vehicle[["Emissions"]],vehicle[["fips"]]=="06037" & vehicle[["year"]]==2002)
a7<-subset(vehicle[["Emissions"]],vehicle[["fips"]]=="06037" & vehicle[["year"]]==2005)
a8<-subset(vehicle[["Emissions"]],vehicle[["fips"]]=="06037" & vehicle[["year"]]==2008)
California<-list(sum(a5),sum(a6),sum(a7),sum(a8))
year<-list("1999","2002","2005","2008")
png("plot6.png", width=480, height=480)
par(mfrow = c(1, 2))
with(Baltimore,{
plot(year,Baltimore,main="Baltimore_PM25",type="lines")
plot(year,California,main="California_PM25",type="lines")})
dev.off()

