plot2 <- function() {
    
    # Read All Data
    filename <- "household_power_consumption.txt"
    All <- read.table(filename, header=TRUE, sep=";", colClasses = "character")
    
    # Date range
    beginDate <- as.Date("2007/02/01", "%Y/%m/%d")
    endDate <- as.Date("2007/02/02", "%Y/%m/%d")
    
    # Subset
    data <- subset(All, as.Date(All[,1], "%d/%m/%Y") >= beginDate & as.Date(All[,1], "%d/%m/%Y") <= endDate)
    
    # concatenate date and time values and convert to date type
    tempDateTime <- paste(data[,1], data[,2], sep = ",")
    tempDateTime <- strptime(tempDateTime, format="%d/%m/%Y,%H:%M:%S")
    
    # Plot and save
    png(filename = "plot2.png", width = 480, height = 480 )
    
    # plots Date & Time vs Global Active Power
    plot(tempDateTime, as.numeric(data[,3]), type = "n", ylab = "Global Active Power (kilowatts)", xlab = "")
    lines(tempDateTime, as.numeric(data[,3]), type = "l")
    
    
    # Close
    dev.off()
}