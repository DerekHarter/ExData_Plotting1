#!/usr/bin/Rscript

# read in the data
source('filter_power_data.R')
power <- filter.power.data()

# create plot3.png
png('plot3.png',  width=480, height=480)
with(power, {
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