library(dplyr)

data <- read.table('household_power_consumption.txt', sep=";", header=TRUE, stringsAsFactors = F)

data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

data <- tbl_df(data)

data <- filter(data, '2007-02-01' == Date | Date == '2007-02-02')


### Now make plot1.png/plot1.R, etc.
