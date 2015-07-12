plot3 <- function() {
    
    # Read Data
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
    png(filename = "plot3.png", width = 480, height = 480 )
    
    # plots Date & Time vs Sub metering 1, 2 and 3
    plot(tempDateTime, as.numeric(data[,7]), type = "n", ylab = "Energy sub metering", xlab = "")
    lines(tempDateTime, as.numeric(data[,7]), type = "l")
    lines(tempDateTime, as.numeric(data[,8]), type = "l", col = "red")
    lines(tempDateTime, as.numeric(data[,9]), type = "l", col = "blue")
    legend("topright", col = c("black", "red", "blue"), legend = c(names(data[7]),names(data[8]),names(data[9])), lty = c(1,1))
    
    
    # Close
    dev.off()
}