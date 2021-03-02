#same steps as in plot3.R's code
data <- read.delim("household_power_consumption.txt",sep = ';')
subdata <- subset(data, data$Date == "1/2/2007"|data$Date == "2/2/2007")
subdata$Date <- as.Date(subdata$Date, "%d/%m/%Y")
Date_and_Time <- data.frame(paste(subdata$Date,subdata$Time))
names(Date_and_Time) <- "Date_and_Time"
subdata <- data.frame(c(Date_and_Time,subdata))
subdata[,1] <- as.POSIXct(subdata[,1], "%Y-%m-%d %H:%M:%S")

#this plot is 4 in 1
png(file = 'plot4.png') #the default setting of this command is height and width as 480 in pixels format
#setting up the plot screen to accommodate 4 plots
par(mfcol = c(2,2),mar = c(5,4,5,2))
#top left plot
plot(subdata$Date_and_Time, as.numeric(subdata$Global_active_power), type = 'l',xlab = "",ylab = "Global Active Power(kilowatts)")
#bottom left plot
plot(subdata$Date_and_Time,as.numeric(subdata$Sub_metering_1), type = 'n', xlab = "", ylab = "Energy sub metering")
lines(subdata$Date_and_Time,as.numeric(subdata$Sub_metering_1))
lines(subdata$Date_and_Time,as.numeric(subdata$Sub_metering_2),col = "red")
lines(subdata$Date_and_Time,as.numeric(subdata$Sub_metering_3),col = "blue")
legend('topright',col = c('black', 'red', 'blue'), lty = 1, legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),cex = 0.75)
#top right plot
plot(subdata$Date_and_Time,as.numeric(subdata$Voltage),type = 'l', xlab = "Datetime", ylab = "Voltage")
#bottom right plot
plot(subdata$Date_and_Time,as.numeric(subdata$Global_reactive_power),type = 'l', xlab = "Datetime", ylab = "Global reactive power")
dev.off()
