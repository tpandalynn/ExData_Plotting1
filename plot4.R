plot4 <- function() {
    
    # Read Data
    filename <- "household_power_consumption.txt"
    All <- read.table(filename, header=TRUE, sep=";", colClasses = "character")
    
    # Date range
    startDate <- as.Date("2007/02/01", "%Y/%m/%d")
    endDate <- as.Date("2007/02/02", "%Y/%m/%d")
    
    # Subset
    data <- subset(DF, as.Date(All[,1], "%d/%m/%Y") >= startDate & as.Date(All[,1], "%d/%m/%Y") <= endDate)
    
    # concatenate date and time values and convert to date type
    tempDateTime <- paste(data[,1], data[,2], sep = ",")
    tempDateTime <- strptime(tempDateTime, format="%d/%m/%Y,%H:%M:%S")
    
    
    # Plot and save
    png(filename = "plot4.png", width = 480, height = 480 )
    
    # setting to draw 4 graphs in 2 by 2 format and ordered by plots 1 and 2
    # followed by plots 3 and 4
    par(mfrow = c(2,2))
    
    # first plot: Date & Time vs Global Active Power
    plot(tempDateTime, as.numeric(data[,3]), type = "n", ylab = "Global Active Power", xlab = "")
    lines(tempDateTime, as.numeric(data[,3]), type = "l")
    
    # second plot: Date & Time vs Voltage
    plot(tempDateTime, as.numeric(data[,5]), type = "n", ylab = names(data[5]), xlab = "datetime")
    lines(tempDateTime, as.numeric(data[,5]), type = "l")
    
    # third plot: Date & Time vs Sub metering 1, 2 and 3
    plot(tempDateTime, as.numeric(data[,7]), type = "n", ylab = "Energy sub metering", xlab = "")
    lines(tempDateTime, as.numeric(data[,7]), type = "l")
    lines(tempDateTime, as.numeric(data[,8]), type = "l", col = "red")
    lines(tempDateTime, as.numeric(data[,9]), type = "l", col = "blue")
    legend("topright", col = c("black", "red", "blue"), legend = c(names(data[7]),names(data[8]),names(data[9])), lty = c(1,1), bty = "n")
    
    # last plot: Date & Time vs Global Reactive Power
    plot(tempDateTime, as.numeric(data[,4]), type = "n", ylab = names(data[4]), xlab = "datetime")
    lines(tempDateTime, as.numeric(data[,4]), type = "l")
    
    
    # Close the PNG file device
    dev.off()
}