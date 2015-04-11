#reads that data in and then seperates it into the 2 days we want to examine
house_data=read.csv("household_power_consumption.txt",sep=";")
Feb=house_data[house_data$Date=="1/2/2007" | house_data$Date=="2/2/2007",]

##Plot 3
Feb[,7]=as.numeric(as.character(Feb[,7]))
Feb[,8]=as.numeric(as.character(Feb[,8]))
Feb[,9]=as.numeric(as.character(Feb[,9]))

png("plot3.png")
plot(Feb$Sub_metering_1,type="l", ylab="Energy sub metering",xlab="",xaxt='n')
lines(Feb$Sub_metering_2,type="l",col="red")
lines(Feb$Sub_metering_3,type="l", col="blue")
axis(side=1,at=c(0,1450,2900),labels=c("Thu","Fri","Sat"))
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1,1),col=c("black","red","blue"),cex=.80)
dev.off()