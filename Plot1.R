## plot1.R script written by Dave Martin
## 5/5/2014
## 
## Exploratory Data Analysis
## Programming Assignment 1, plot 1

## read in the data
dframe <- read.table("household_power_consumption.txt", header = T, 
                     colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"), 
                     na.strings = "?", sep=";")

## get a datetime
dframe$DT <- strptime(paste(dframe$Date, dframe$Time, sep=" "), format = "%d/%m/%Y %H:%M:%S")

## get start and end date:time
startdate <- as.POSIXlt("2007-02-01 00:00:00")
enddate <- as.POSIXlt("2007-02-02 23:59:59")

## subset the two days
subdf <- subset(dframe, dframe$DT >= startdate & dframe$DT <= enddate)

## open the png graphics device
png("plot1.png", width=480, height=480)

## draw the histogram with the proper colour, title and labels
hist(subdf$Global_active_power, col="red", xlab="Global Active Power (kilowatts)", ylab = "Frequency", main = "Global Active Power")

dev.off()
