library(dplyr)

# Reading data
projectdata <- read.csv2("household_power_consumption.csv", dec = ".", na.strings = "?")

# Get only appropriate dates
datafebr <- filter(projectdata, Date == "1/2/2007" | Date == "2/2/2007" )

# Make new column with Date and Time converted to Date/time
datafebr$Timestamp <- paste(datafebr$Date, datafebr$Time, sep = " ")
datafebr$Timestamp <- strptime(datafebr$Timestamp, format = "%d/%m/%Y %H:%M:%S")

# Create plot
png(file = "plot2.png")
plot(x = datafebr$Timestamp, y = datafebr$Global_active_power, type="n", xlab = "", ylab = "Global active power (kilowatts)")
lines(x = datafebr$Timestamp, y = datafebr$Global_active_power)
dev.off()