#reads that data in and then seperates it into the 2 days we want to examine
house_data=read.csv("household_power_consumption.txt",sep=";")
Feb=house_data[house_data$Date=="1/2/2007" | house_data$Date=="2/2/2007",]

#sets the data as numeric so that it can be read by the hist() command
Feb=data.frame(Feb)
Feb[,3]=as.numeric(as.character(Feb[,3]))

##Plot 1
#generates the histogram with the required additions
png("plot1.png")
hist(Feb$Global_active_power,xlab="Global Active Power (kilowatts)",main="Global Active Power",col="red1")
yticks<-seq(200,1200,200)
axis(2,at=yticks,labels=c("200","400","600","800","1000","1200"))
dev.off()