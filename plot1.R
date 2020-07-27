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

### 2 - Plotting ###

# 2.1 - open png graphics device and set global parameters
png('plot1.png', bg = 'transparent')
par(mfrow = c(1, 1))

# 2.2 - Plot Global_active_power histogram
hist(heps$Global_active_power, col='red', main = 'Global Active Power',
     xlab = 'Global Active Power (kilowatts)', ylab = 'Frequency')

# 2.3 - close png graphics device
dev.off()
