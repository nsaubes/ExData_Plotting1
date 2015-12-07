data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")

data.use <- data[data$Date %in% c("1/2/2007","2/2/2007"), ]

date <- strptime(paste(data.use$Date, data.use$Time, sep = " "), "%d/%m/%Y %H:%M:%S")

gap <- as.numeric(data.use$Global_active_power)

plot(date, gap, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

dev.copy(png, file = "Plot2.png", width = 480, height = 480)

dev.off()