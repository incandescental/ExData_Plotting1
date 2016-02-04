# Code for creation of Plot 4

# Read data
pow <- read.table("./household_power_consumption.txt", sep = ";", header = T, na.strings="?")

# Convert dates
pow$Date <- as.Date(pow$Date, "%d/%m/%Y")

# Subset required dates

pow2 <- subset(pow, (Date >= "2007-02-01") & (Date <= "2007-02-02"))

# concatenate date and time into new column

pow2 <- transform(pow2, datetime=paste0(Date," ",Time))
pow2$datetime <- strptime(pow2$datetime, "%Y-%m-%d %H:%M:%S")

# set global graph settings

par(mfrow = c(2,2), cex = 0.6)

# Specify graph 1

plot(pow2$datetime,pow2$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")

# Specify graph 2

plot(pow2$datetime, pow2$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")

# Specify graph 3

plot(pow2$datetime,pow2$Sub_metering_1,type = "l", xlab = "", ylab = "Energy sub metering")
lines(pow2$datetime, pow2$Sub_metering_2, type = "l", col = "red")
lines(pow2$datetime, pow2$Sub_metering_3, type = "l", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = c(1,1,1), col = c("black", "red", "blue"), cex =0.9, bty = "n")

# Specify graph 4

plot(pow2$datetime, pow2$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")

# save file

dev.copy(png,'plot4.png')
dev.off()