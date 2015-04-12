rm(list=ls())

hpc<-read.table("household_power_consumption.txt",header=TRUE,sep=";",stringsAsFactors=TRUE,na.strings="?")
hpc$DateTimeChar<-paste(hpc$Date,hpc$Time,sep=" ")
hpc$DateTime<-strptime(hpc$DateTimeChar,format='%d/%m/%Y %H:%M:%S')

hpcsub<-subset(hpc,Date=="1/2/2007" |Date=="2/2/2007")

png(filename = "plot1.png",width = 480, height = 480, units = "px")
hist(hpcsub$Global_active_power, col="red",main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()
