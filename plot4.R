#!/usr/bin/Rscript

# read in the data
source('filter_power_data.R')
power <- filter.power.data()

# create plot4.png
png('plot4.png',  width=480, height=480)
par(mfrow=c(2,2), mar=c(4,4,1,1), oma=c(0,0,0,0))

# upper left plot 1,1
plot(power$DateTime, power$Global_active_power, type='l', xlab='', ylab='Global Active Power')

# upper right plot 1,2
plot(power$DateTime, power$Voltage, type='l', xlab='datetime', ylab='Voltage')

# lower left plot 2,1
with(power, {
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
plot(power$DateTime, power$Global_reactive_power, type='l', xlab='datetime', 
     ylab='Global_reactive_power')
dev.off()