## Exploratory Data Course week 1 Project
## Code to create plot2.png

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

## create data plot
plot(datetime, globalActivePower, type= "l", xlab="", ylab="Global Active Power (kilowatts)")

## create PNG file and turn off dev console on the file
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()