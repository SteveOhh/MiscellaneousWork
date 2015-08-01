# Read data in

library(dplyr)

data <- read.table('household_power_consumption.txt', sep=";", header=TRUE, stringsAsFactors = F)

DateTime <- paste(data$Date, data$Time)

data$DateTime <- strptime(DateTime, format = "%d/%m/%Y %H:%M:%S")

data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

data <- tbl_df(data)

data <- filter(data, '2007-02-01' == Date | Date == '2007-02-02')

data[,3:9] <- sapply(data[,3:9], as.numeric)


# Create graph
png(file = 'plot2.png')
plot(data$Time, data$Global_active_power, type = "line")
dev.off()