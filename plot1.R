#Reading the .txt file into R using read.delim which is used to read .txt files in R
#the .txt file is seperated by ';'
data <- read.delim("household_power_consumption.txt",sep = ';')

#subsetting only the part of the data that  we require for this operation
subdata <- subset(data, data$Date == "1/2/2007"|data$Date == "2/2/2007")

# creating a histogram as asked in the assignment
png(file = 'plot1.png') #the default setting of this command is height and width as 480 in pixels format
hist(as.numeric(subdata$Global_active_power), col = "red",xlab = "Global Active Power(kilowatts)", main = "Global Active Power")
dev.off()
