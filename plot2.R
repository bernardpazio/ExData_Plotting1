library(data.table)

data = fread('household_power_consumption.txt', header=TRUE, sep=';', na.strings='?')
data$Date = as.Date(data$Date, format='%d/%m/%Y')
data = data[Date %in% as.Date(c('2007-02-01', '2007-02-02'))]
data[,DateTime:=strptime(paste(Date, Time), format='%Y-%m-%d %H:%M:%S')]

png('plot2.png')
plot(data$DateTime, data$Global_active_power, ylab='Global Active Power (kilowatts)', xlab='', type='l')
dev.off()