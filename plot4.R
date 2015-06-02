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

# create plot4.png
png('plot4.png',  width=480, height=480)
par(mfrow=c(2,2), mar=c(4,4,1,1), oma=c(0,0,0,0))

# upper left plot 1,1
plot(energydf$DateTime, energydf$Global_active_power, type='l', xlab='', ylab='Global Active Power')

# upper right plot 1,2
plot(energydf$DateTime, energydf$Voltage, type='l', xlab='datetime', ylab='Voltage')

# lower left plot 2,1
with(energydf, {
    plot(DateTime, Sub_metering_1, type='n', ylab='Energy sub metering', xlab='')
    lines(DateTime, Sub_metering_1, col='black')
    lines(DateTime, Sub_metering_2, col='red')
    lines(DateTime, Sub_metering_3, col='blue')
})
legend('topright', 
       legend=c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), 
       col=c('black', 'red', 'blue'),
       lty=c(1,1,1),
       bty='n')

# lower right plot 2,2
plot(energydf$DateTime, energydf$Global_reactive_power, type='l', xlab='datetime', 
     ylab='Global_reactive_power')
dev.off()