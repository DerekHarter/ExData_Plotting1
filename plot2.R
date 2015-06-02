#!/usr/bin/Rscript

# read in the data
source('filter_power_data.R')
power <- filter.power.data()

# create plot2.png
png('plot2.png',  width=480, height=480)
plot(power$DateTime, power$Global_active_power, type='l', ylab='Global Active Power (kilowats)', xlab='')
dev.off()