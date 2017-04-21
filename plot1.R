## Exploratory Data Course week 1 Project
## Code to create plot1.png

## read in entire data file
wholeData <- "./Coursera Data/household_power_consumption.txt"

## turn wholeData into a data table for ease of use
data <- read.table(wholeData, header=TRUE, sep= ";", 
                   stringsAsFactors= FALSE, dec= ".")

## select relevant data via date
dataSubSet <- data[data$Date %in% c("1/2/2007", "2/2/2001") ,]

## create vector of required values
globalActivePower <- as.numeric(dataSubSet$Global_active_power)

## create histogram 
hist(globalActivePower, col= "red", main= "Global Active Power", 
     xlab="Global Active Power (kilowatts)")

## create PNG file and turn off dev console on the file
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()