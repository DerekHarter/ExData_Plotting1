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


# create plot2.png
png('plot2.png',  width=480, height=480)
plot(energydf$DateTime, energydf$Global_active_power, type='l', ylab='Global Active Power (kilowats)', xlab='')
dev.off()