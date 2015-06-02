#!/usr/bin/Rscript

# read in the data
source('filter_power_data.R')
power <- filter.power.data()

# create plot1.png
png('plot1.png',  width=480, height=480)
hist(power$Global_active_power, col='red', xlab='Global Active Power (kilowatts)', main = 'Global Active Power')
dev.off()