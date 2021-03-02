#Same steps used in plot1.R code
data <- read.delim("household_power_consumption.txt",sep = ';')
subdata <- subset(data, data$Date == "1/2/2007"|data$Date == "2/2/2007")

#reclassifying the date column in the raw data as as Date format as raw data was in the character format
subdata$Date <- as.Date(subdata$Date, "%d/%m/%Y")
#Making a seperate dataframe with one column that combines date and time columns from the subdata dataframe for convienience
Date_and_Time <- data.frame(paste(subdata$Date,subdata$Time))
#Naming the dataframe as Date_and_Time
names(Date_and_Time) <- "Date_and_Time"
#Adding the newly made dataframe as the first column in the subdata dataframe
subdata <- data.frame(c(Date_and_Time,subdata))

#reclassifying the newly made first column as a posixct class which is a class for time representation in R
subdata[,1] <- as.POSIXct(subdata[,1], "%Y-%m-%d %H:%M:%S")

#Plotting the 2nd plot as asked in the assignment
plot(subdata$Date_and_Time, as.numeric(subdata$Global_active_power), type = 'l',xlab = "",
     ylab = "Global Active Power(kilowatts)",main = 'Global Active Power vs. Time')