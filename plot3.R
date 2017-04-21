## Exploratory Data Course week 1 Project
## Code to create plot3.png

## read in entire data file
wholeData <- "./Coursera Data/household_power_consumption.txt"

## turn wholeData into a data table for ease of use
data <- read.table(wholeData, header=TRUE, sep= ";", 
                   stringsAsFactors= FALSE, dec= ".")

## turn Date column into Date class
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

## select relevant data via date
dataSubSet <- subset(data, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))

##
datetime <- strptime(paste(dataSubSet$Date, dataSubSet$Time), "%Y-%m-%d %H:%M:%S")
datetime <- as.POSIXct(datetime)

## create vector of required values
globalActivePower <- as.numeric(dataSubSet$Global_active_power)

## initialise submetering lines
subMetering1 <- as.numeric(dataSubSet$Sub_metering_1)
subMetering2 <- as.numeric(dataSubSet$Sub_metering_2)
subMetering3 <- as.numeric(dataSubSet$Sub_metering_3)

## create data plot w/ sub metering 1 
plot(datetime, subMetering1, type= "l", xlab="", ylab="Energy sub metering")
## add sum metering 2 & 3 lines
lines(datetime, subMetering2, type= "l", col="red")
lines(datetime, subMetering3, type= "l", col="blue")
## add legend
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, 
       lwd = 2.5, col=c("black", "red", "blue"))


## create PNG file and turn off dev console on the file
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()