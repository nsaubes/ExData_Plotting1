data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")

data.use <- data[data$Date %in% c("1/2/2007","2/2/2007"), ]

gap <- as.numeric(data.use$Global_active_power)

hist(gap, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency")

dev.copy(png, file = "Plot1.png")

dev.off()