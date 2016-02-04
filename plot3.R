# Code for creation of Plot 3

# Read data
pow <- read.table("./household_power_consumption.txt", sep = ";", header = T, na.strings="?")

# Convert dates
pow$Date <- as.Date(pow$Date, "%d/%m/%Y")

# Subset required dates

pow2 <- subset(pow, (Date >= "2007-02-01") & (Date <= "2007-02-02"))

# concatenate date and time into new column

pow2 <- transform(pow2, datetime=paste0(Date," ",Time))
pow2$datetime <- strptime(pow2$datetime, "%Y-%m-%d %H:%M:%S")

# Specify graph

png("plot3.png")

plot(pow2$datetime,pow2$Sub_metering_1,type = "l", xlab = "", ylab = "Energy sub metering")
lines(pow2$datetime, pow2$Sub_metering_2, type = "l", col = "red")
lines(pow2$datetime, pow2$Sub_metering_3, type = "l", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = c(1,1,1), col = c("black", "red", "blue")) 

# save file

dev.off()