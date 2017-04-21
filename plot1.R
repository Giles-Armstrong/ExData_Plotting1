
## read in entire data file
wholeData <- "./household_power_consumption.txt"

## turn wholeData into a data table for ease of use
data <- read.table(wholeData, header=TRUE, sep= ";", 
                   stringsAsFactors= FALSE, dec= ".")

## select relevant data
dataSubSet <- data[data$Date %in% c("1/2/2007", "2/2/2001") ,]

globalActivePower <- as.numeric(dataSubSet$Global_active_power)
hist(globalActivePower, col= "red", main= "Global Active Power", 
     xlab="Global Active Power (kilowatts)")
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()