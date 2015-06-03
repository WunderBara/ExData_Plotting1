library(dplyr)

# Reading data
projectdata <- read.csv2("household_power_consumption.csv", dec = ".", na.strings = "?")

# Get only appropriate dates
datafebr <- filter(projectdata, Date == "1/2/2007" | Date == "2/2/2007" )

# Make new column with Date and Time converted to Date/time
datafebr$Timestamp <- paste(datafebr$Date, datafebr$Time, sep = " ")
datafebr$Timestamp <- strptime(datafebr$Timestamp, format = "%d/%m/%Y %H:%M:%S")

# Make histogram
png(file = "plot1.png")
hist(datafebr$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global active power (kilowatts)")
dev.off()