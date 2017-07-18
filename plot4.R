library(data.table)

data = fread('household_power_consumption.txt', header=TRUE, sep=';', na.strings='?')
data$Date = as.Date(data$Date, format='%d/%m/%Y')
data = data[Date %in% as.Date(c('2007-02-01', '2007-02-02'))]
data[,DateTime:=strptime(paste(Date, Time), format='%Y-%m-%d %H:%M:%S')]

png('plot4.png')

par(mfrow=c(2,2))

plot(data$DateTime, data$Global_active_power, ylab='Global Active Power (kilowatts)', xlab='', type='l')

plot(data$DateTime, data$Voltage, ylab='Voltage', xlab='datetime', type='l')

plot(data$DateTime, data$Sub_metering_1, type='n', xlab='', ylab='Energy sub metering')
lines(data$DateTime, data$Sub_metering_1)
lines(data$DateTime, data$Sub_metering_2, col='red')
lines(data$DateTime, data$Sub_metering_3, col='blue')
legend('topright', legend=c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), col=c('black', 'red', 'blue'), lty=1, bty="n")

plot(data$DateTime, data$Global_reactive_power, ylab='Global_reactive_power', xlab='datetime', type='l')

dev.off()