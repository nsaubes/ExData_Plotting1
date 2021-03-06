data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")

data.use <- data[data$Date %in% c("1/2/2007","2/2/2007"), ]

date <- strptime(paste(data.use$Date, data.use$Time, sep = " "), "%d/%m/%Y %H:%M:%S")

gap <- as.numeric(data.use$Global_active_power)

sm1 <- as.numeric(data.use$Sub_metering_1)

sm2 <- as.numeric(data.use$Sub_metering_2)

sm3 <- as.numeric(data.use$Sub_metering_3)

grpow <- as.numeric(data.use$Global_reactive_power)

par(mfrow = c(2, 2))
with(data.use, {
  
        hist(gap, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency")
  
        plot(date, gap, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
  
        plot(date, sm1, type = "l", xlab = "", ylab = "Energy sub metering")
        lines(date, sm2, type = "l", col = "red")
        lines(date, sm3, type = "l", col = "blue")
        legend("topright", inset = 0.05, bty = "n", c("Sub met. 1", "Sub_met. 2", "Sub_met. 3"), lty=1, lwd=1, cex = 0.5, y.intersp = 0.5, col=c("black", "red", "blue"))

        plot(date, grpow, type = "l", xlab = "", ylab = "Global Reactive Power")
        
})

dev.copy(png, file = "Plot4.png", width = 480, height = 480)

dev.off()