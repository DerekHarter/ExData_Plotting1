#!/usr/bin/Rscript
## Author: Derek Harter
## Date  : June 2, 2015
## Assig : Data Science, Exploratory Data Analysis; Course Project 1
##
## Desc  : Functions to read in and filter the household power
##         consumption data.
library(lubridate)

filter.power.data <- function() {
    ## Thus function performs the following tasks:
    ## 1. read in household power consumption data
    ## 2. reformat time and date string fields into a real date, combining
    ##    them into a DateTime field
    ## 3. Filter the data for specific dates of interest
    ## 4. Return the resulting dataframe with only those data that was
    ##    filtered.
    ## For now this function reads in all of the 2e6+ records, then filters
    ## them in memory, though in future we might need to filter data
    ## on the fly instead, possibly using something like read.csv.sql
    ##
    ## Returns:
    ##    standard dataframe of power data, filtered for dates of interest
    
    # 1. read in household power consumption data from file
    #raw <- read.delim('data/household_power_consumption.txt', sep=';', na.strings='?', nrows=100)
    raw <- read.delim('data/household_power_consumption.txt', sep=';', na.strings='?')

    # 2. reformat time and dat string fields into a real date, combine
    #    them into a DateTime field
    #raw$Date <- strptime(raw$Date, "%d/%m/%Y")
    raw$DateTime <- dmy_hms(paste(raw$Date, raw$Time))
    
    # 3. filter the data for specific dates of interest
    #    these could be passed in as function arguments in
    #    a real project if filtering data for different subsets
    # filter on dates, only get data for dates 2007-02-01 and 2007-02-02
    begin <- ymd_hms('2007-02-01 00:00:00')
    end <- ymd_hms('2007-02-02 23:59:59')
    # (raw$Date >= begin & raw$Date <= end)
    power <- raw[(raw$DateTime >= begin & raw$DateTime <= end),]
    
    # 4. return the resulting filtered data frame
    power
    
}
