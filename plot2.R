# Code for creation of Plot 2

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

plot(pow2$datetime,pow2$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

# save file

dev.copy(png,'plot2.png')
dev.off()