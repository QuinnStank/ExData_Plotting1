#reads that data in and then seperates it into the 2 days we want to examine
house_data=read.csv("household_power_consumption.txt",sep=";")
Feb=house_data[house_data$Date=="1/2/2007" | house_data$Date=="2/2/2007",]

#sets the data as numeric to be used in the numerous plots
Feb[,4]=as.numeric(as.character(Feb[,4]))
Feb[,5]=as.numeric(as.character(Feb[,5]))
Feb[,7]=as.numeric(as.character(Feb[,7]))
Feb[,8]=as.numeric(as.character(Feb[,8]))
Feb[,9]=as.numeric(as.character(Feb[,9]))

#sets the points for the labels for the 4th plot
yticks<-seq(0.1,0.5,0.1)

#reads the plot into a png file
png("plot4.png")
par(mfrow=c(2,2)) #adds all 4 plots into same image
#plot 1
plot(Feb$Global_active_power,type="l", ylab="Global Active Power (kilowatts)", xlab="",xaxt='n')
axis(side=1,at=c(0,1450,2900),labels=c("Thu","Fri","Sat"))

#Second Plot
plot(Feb$Voltage,type="l",ylab="Voltage",xlab="datetime",xaxt='n')
axis(side=1,at=c(0,1450,2900),labels=c("Thu","Fri","Sat"))

#Third Plot
plot(Feb$Sub_metering_1,type="l", ylab="Energy sub metering",xlab="",xaxt='n')
lines(Feb$Sub_metering_2,type="l",col="red")
lines(Feb$Sub_metering_3,type="l", col="blue")
axis(side=1,at=c(0,1450,2900),labels=c("Thu","Fri","Sat"))
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1,1),bty="n",col=c("black","red","blue"),cex=.7)

#Plot 4
plot(Feb$Global_reactive_power,type="l",ylab="Global_reactive_power",xlab="datetime",xaxt='n')
axis(side=1,at=c(0,1450,2900),labels=c("Thu","Fri","Sat"))
axis(2,at=yticks,labels=yticks)

dev.off()