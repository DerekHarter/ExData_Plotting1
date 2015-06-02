# read in the data
library(lubridate)

#raw <- read.delim('data/household_power_consumption.txt', sep=';', na.strings='?', nrows=100)
raw <- read.delim('data/household_power_consumption.txt', sep=';', na.strings='?')
#raw$Date <- strptime(raw$Date, "%d/%m/%Y")
raw$DateTime <- dmy_hms(paste(raw$Date, raw$Time))

# filter on dates, only get data for dates 2007-02-01 and 2007-02-02
begin <- ymd_hms('2007-02-01 00:00:00')
end <- ymd_hms('2007-02-02 23:59:59')
# (raw$Date >= begin & raw$Date <= end)
energydf <- raw[(raw$DateTime >= begin & raw$DateTime <= end),]


# create plot3.png
png('plot3.png',  width=480, height=480)
with(energydf, {
    plot(DateTime, Sub_metering_1, type='n', ylab='Energy sub metering', xlab='')
    lines(DateTime, Sub_metering_1, col='black')
    lines(DateTime, Sub_metering_2, col='red')
    lines(DateTime, Sub_metering_3, col='blue')
})
legend('topright', 
       legend=c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), 
       col=c('black', 'red', 'blue'),
       lty=c(1,1,1))
dev.off()