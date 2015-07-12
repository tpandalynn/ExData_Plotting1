plot1 <- function() {
    
    # Read All Data
    filename <- "household_power_consumption.txt"
    All <- read.table(filename, header=TRUE, sep=";", colClasses = "character")
    
    # Date range
    startDate <- as.Date("2007/02/01", "%Y/%m/%d")
    endDate <- as.Date("2007/02/02", "%Y/%m/%d")
    
    # Subset
    data <- subset(All, as.Date(All[,1], "%d/%m/%Y") >= startDate & as.Date(All[,1], "%d/%m/%Y") <= endDate)
    
    # Create histogram and save as png
    png(filename = "plot1.png", width = 480, height = 480 )
    hist(as.numeric(data[,3]), main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency", col = "red")
    
    # Close the PNG file device
    dev.off()
}