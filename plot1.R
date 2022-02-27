## Plot 1

library(lubridate)
library(dplyr)

# read in data
epc <- read.delim("data/household_power_consumption.txt", 
                  header = TRUE,
                  sep = ";")
# format Date as Date class
epc$Date <- dmy(epc$Date)
epc$Time <- hms(epc$Time)

# subset to 2007-02-01, 2007-02-02
epcFeb <- epc[epc$Date == "2007-02-01"|
                epc$Date == "2007-02-02",]

# converting the other columns to numeric class
epcFeb$Global_active_power <- as.numeric(epcFeb$Global_active_power)

png(filename = "plot1.png",
    width = 480,
    height = 480)
hist(epcFeb$Global_active_power, col = "red",
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)")
dev.off()
