# Read data in

library(dplyr)

data <- read.table('household_power_consumption.txt', sep=";", header=TRUE, stringsAsFactors = F)

data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

data <- tbl_df(data)

data <- filter(data, '2007-02-01' == Date | Date == '2007-02-02')

data[,3:9] <- sapply(data[,3:9], as.numeric)

DateTime <- paste(as.character(data$Date), data$Time)

data$DateTime <- strptime(DateTime, "%Y-%m-%d %H:%M:%S")

# Create graph
png(file = 'plot3.png')
with(data, plot(DateTime, Sub_metering_1, col = "black", type = "l",
     ylab="Energy sub metering", xlab=""))
with(data, points(DateTime, Sub_metering_2, col = "red", type = "l"))
with(data, points(DateTime, Sub_metering_3, col = "blue", type = "l"))
legend("topright", lty=1, col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()
