data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")

data.use <- data[data$Date %in% c("1/2/2007","2/2/2007"), ]

date <- strptime(paste(data.use$Date, data.use$Time, sep = " "), "%d/%m/%Y %H:%M:%S")

sm1 <- as.numeric(data.use$Sub_metering_1)

sm2 <- as.numeric(data.use$Sub_metering_2)

sm3 <- as.numeric(data.use$Sub_metering_3)

plot(date, sm1, type = "l", xlab = "", ylab = "Energy sub metering")

lines(date, sm2, type = "l", col = "red")

lines(date, sm3, type = "l", col = "blue")

legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

dev.copy(png, file = "Plot3.png", width = 480, height = 480)

dev.off()