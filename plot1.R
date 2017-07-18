library(data.table)

data = fread('household_power_consumption.txt', header=TRUE, sep=';', na.strings='?')
data$Date = as.Date(data$Date, format='%d/%m/%Y')
data = data[Date %in% as.Date(c('2007-02-01', '2007-02-02'))]

png(filename='plot1.png')
hist(data$Global_active_power, col='red', main='Global Active Power', xlab='Global Active Power (kilowatts)')
dev.off()