## Plot 4

library(lubridate)
library(dplyr)

# read in data
epc <- read.delim("data/household_power_consumption.txt", 
                  header = TRUE,
                  sep = ";")

epc$DateConcat <- paste(epc$Date, epc$Time, sep = "_")
epc$DateConcat <- dmy_hms(epc$DateConcat)

# format Date as Date class
epc$Date <- dmy(epc$Date)
epc$Time <- hms(epc$Time)


# subset to 2007-02-01, 2007-02-02
epcFeb <- epc[epc$Date == "2007-02-01"|
                epc$Date == "2007-02-02",]

png(filename = "plot4.png",
    width = 480,
    height = 480)
par(mfrow = c(2,2))
# 4a Global Active Power
plot(epcFeb$DateConcat, epcFeb$Global_active_power,
     type = "S",
     xlab = "",
     ylab = "Global Active Power (kilowatts)")

# 4b Voltage
plot(epcFeb$DateConcat, epcFeb$Voltage,
     type = "S",
     xlab = "",
     ylab = "Voltage")

# 4c Energy sub metering
plot(epcFeb$DateConcat, epcFeb$Sub_metering_1, type = "S", col = "black",
     xlab = "",
     ylab = "Energy sub metering")
lines(epcFeb$DateConcat, epcFeb$Sub_metering_2, type = "S", col = "red")
lines(epcFeb$DateConcat, epcFeb$Sub_metering_3, type = "S", col = "blue")
legend("topright",
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "red", "blue"), lty = 1)

# 4d Global Reactive power
plot(epcFeb$DateConcat, epcFeb$Global_reactive_power,
     type = "S",
     xlab = "",
     ylab = "Global Reactive Power")
dev.off()
