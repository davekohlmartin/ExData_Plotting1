## plot3.R script written by Dave Martin
## 5/5/2014
## Programming Assignment 1, plot 3
## Exploratory Data Analysis

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

## png device
png("plot3.png", width=480, height=480)

## plot 3
plot(subdf$DT, subdf$Sub_metering_1, col="black", type="l", ylab="Energy sub metering")
lines(subdf$DT, subdf$Sub_metering_2, col="red", type="l")
lines(subdf$DT, subdf$Sub_metering_3, col="blue", type="l")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty=c(1, 1, 1), col=c("black", "red", "blue"))

dev.off()