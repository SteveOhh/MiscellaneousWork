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
png(file = 'plot1.png')
hist(data$Global_active_power, col = "red", main = "Global Active Power",
     xlab="Global Active Power (kilowatts)")
dev.off()