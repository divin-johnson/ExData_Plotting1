#same steps as used in plot2.R's code
data <- read.delim("household_power_consumption.txt",sep = ';')
subdata <- subset(data, data$Date == "1/2/2007"|data$Date == "2/2/2007")
subdata$Date <- as.Date(subdata$Date, "%d/%m/%Y")
Date_and_Time <- data.frame(paste(subdata$Date,subdata$Time))
names(Date_and_Time) <- "Date_and_Time"
subdata <- data.frame(c(Date_and_Time,subdata))
subdata[,1] <- as.POSIXct(subdata[,1], "%Y-%m-%d %H:%M:%S")

#The third plot requires 3 different lines representing 3 different variables from the dataframe in a single plot
#Making an empty canvas for plot using command type = 'n' 
plot(subdata$Date_and_Time,as.numeric(subdata$Sub_metering_1), type = 'n', xlab = "", ylab = "Energy sub metering")
#adding lines to the empty canvas plot for the required three variables with 3 different colors as asked
lines(subdata$Date_and_Time,as.numeric(subdata$Sub_metering_1))
lines(subdata$Date_and_Time,as.numeric(subdata$Sub_metering_2),col = "red")
lines(subdata$Date_and_Time,as.numeric(subdata$Sub_metering_3),col = "blue")
#adding an information section to the topright of the plot that identifies each variable by its distinctive color 
legend('topright',col = c('black', 'red', 'blue'), lty = 1, legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3") )