# Code for creation of Plot 1

# Read data
pow <- read.table("./household_power_consumption.txt", sep = ";", header = T, na.strings="?")

# Convert dates
pow$Date <- as.Date(pow$Date, "%d/%m/%Y")

# Subset required dates

pow2 <- subset(pow, (Date >= "2007-02-01") & (Date <= "2007-02-02"))

# Specify histogram

hist(pow2$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", ylab = "Frequency", main = "Global Active Power")

# save file

dev.copy(png,'plot1.png')
dev.off()
