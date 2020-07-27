library(readr)
library(lubridate)

### 1 - Data preparation ###

# 1.1 - Ensure plotting data is present
if (!file.exists('household_power_consumption.zip')) {
        download.file('https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip',
                      'household_power_consumption.zip')
}
if (!file.exists('household_power_consumption.txt')) {
        unzip('household_power_consumption.zip')
}

# 1.2 - Read data for 2007-02-01 and 2007-02-02
heps <- read_delim('household_power_consumption.txt', delim = ';', na = '?',
                   col_types = 'ccddddddd') %>%
        subset(Date %in% c('1/2/2007', '2/2/2007'))

# 1.3 - Parse Date and Time and store in separate column
heps$datetime <- dmy_hms(paste(heps$Date, heps$Time, sep = ' '))

### 2 - Plotting ###

# 2.1 - open png graphics device and set global parameters
png('plot2.png', bg = 'transparent')
par(mfrow = c(1, 1))

# 2.2 - Plot Global_active_power line chart
with(heps, plot(Global_active_power ~ datetime, type = 'l',
                xlab = '', ylab = 'Global Active Power (kilowatts)'))

# 2.3 - close png graphics device
dev.off()
