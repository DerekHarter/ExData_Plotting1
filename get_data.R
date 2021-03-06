#!/usr/bin/Rscript
## Author: Derek Harter
## Date  : June 2, 2015
## Assig : Data Science, Exploratory Data Analysis; Course Project 1
##
## Desc  : This script simply obtains the required data set for the course
##   project and unarchives it into the top level of the working repository
##   directory.  We do not want to put this large of a data set into the
##   git source repository, it should be put into a data repository/store.
##   This script should only need to be run one time to initially pull
##   down the raw data from the data repository and unarchive it for
##   processing.

# Step 1: download the data set
# NOTE: The download may be dependent on having the wget command installed on
#  your system.
dataDir <- 'data'
if (!file.exists(dataDir)) {
    dir.create(dataDir)
}
setwd(dataDir)
dataUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
destFile <- "household_power_consumption.zip"
download.file(dataUrl, destFile, method="wget")

# Step 2: unzip and expand the archive
unzip(destFile)