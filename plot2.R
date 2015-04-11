#reads that data in and then seperates it into the 2 days we want to examine
house_data=read.csv("household_power_consumption.txt",sep=";")
Feb=house_data[house_data$Date=="1/2/2007" | house_data$Date=="2/2/2007",]

#sets the data as numeric so that it can be read by the hist() command
Feb=data.frame(Feb)
Feb[,3]=as.numeric(as.character(Feb[,3]))

##Plot 2
png("plot2.png")
plot(Feb$Global_active_power,type="l", ylab="Global Active Power (kilowatts)", xlab="",xaxt='n')
axis(side=1,at=c(0,1450,2900),labels=c("Thu","Fri","Sat"))
dev.off()