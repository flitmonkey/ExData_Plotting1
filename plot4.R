rm(list=ls())

hpc<-read.table("household_power_consumption.txt",header=TRUE,sep=";",stringsAsFactors=TRUE,na.strings="?")
hpc$DateTimeChar<-paste(hpc$Date,hpc$Time,sep=" ")
hpc$DateTime<-strptime(hpc$DateTimeChar,format='%d/%m/%Y %H:%M:%S')

hpcsub<-subset(hpc,Date=="1/2/2007" |Date=="2/2/2007")

png(filename = "plot4.png",width = 480, height = 480, units = "px")

par(mfrow=c(2,2))

with(hpcsub, plot(DateTime, Global_active_power, type='l',ylab='Global Active Power',xlab=''))
with(hpcsub, plot(DateTime, Voltage, type='l',ylab='Voltage',xlab='datetime'))

plot(hpcsub$DateTime, hpcsub$Sub_metering_1, type='l',ylab='Energy sub metering',xlab='',col="black")
lines(hpcsub$DateTime, hpcsub$Sub_metering_2, type='l', col='red')
lines(hpcsub$DateTime, hpcsub$Sub_metering_3, type='l', col='blue')
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=c(1,1,1,1),bty="n")

with(hpcsub, plot(DateTime, Global_reactive_power, type='l',xlab='datetime'))





dev.off()