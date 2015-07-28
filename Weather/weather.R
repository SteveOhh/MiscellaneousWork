library(weatherData)
library(dplyr)

# IndWeather <- tbl_df(getWeatherForYear("IND", "2014"))
# SJWeather <- tbl_df(getWeatherForYear("SJC", "2014"))

IndWeather <- getWeatherForYear("IND", "2014")
SJWeather <- getWeatherForYear("SJC", "2014")
SFWeather <- getWeatherForYear("SFO", "2014")

IndWeather$City <- "Indy"
SJWeather$City <- "San Jose"
SFWeather$City <- "San Francisco"

weather <- rbind(IndWeather, SJWeather)
weather$City <- as.factor(weather$City)

##### plot daily average temperatures for 2014
png(filename = "MWvsSV.png")
ggplot(weather, aes(x=Date, y = Mean_TemperatureF, color = City)) + geom_line() + 
    ggtitle("Average daily temperature") + ylab("Fahrenheit")
dev.off()


#############
# adding more cities...
weather2 <- rbind(IndWeather, SJWeather, SFWeather)
weather2$City <- as.factor(weather$City)
ggplot(weather2, aes(x=Date, y = Mean_TemperatureF, color = City)) + geom_line()
#############


### what are the differences between days?
weather <- tbl_df(weather)
weather <- weather %>% mutate(diff = Mean_TemperatureF - lag(Mean_TemperatureF))
png(filename = "dayDifferences.png", width = 800, height = 634)
ggplot(weather, aes(x=Date, y = diff, color = City)) + geom_line() + 
    ggtitle("Difference from previous day's temperature") + ylab("Fahrenheit")
dev.off()

### what are the 
