powerdata_all<- read.table("household_power_consumption.txt", header = TRUE, sep = ";",na.strings=c("?","NA"," ","#DIV/0!"))
powerdata_all$Date<-as.Date(powerdata_all$Date,"%d/%m/%Y")
powerdata<-powerdata_all[powerdata_all$Date>=as.Date("2007-02-01") & powerdata_all$Date<=as.Date("2007-02-2"),]
powerdata$DateTime<-strptime(paste(powerdata$Date,powerdata$Time),"%Y-%m-%d %H:%M:%S")

par(mfrow=c(2,2))
plot(powerdata$DateTime, powerdata$Global_active_power, type = "l", 
     ylab="Global Active Power", xlab="")

plot(powerdata$DateTime, powerdata$Voltage, type = "l", 
     ylab="Voltage", xlab = "datetime")

plot(powerdata$DateTime, powerdata$Sub_metering_1, type = "l",
     ylab="Energy Sub Metering",xlab = "")
lines(powerdata$DateTime, powerdata$Sub_metering_2, type = "l",col="red")
lines(powerdata$DateTime, powerdata$Sub_metering_3, type = "l",col="blue")
legend("topright", col = c("black","blue", "red"), 
       legend = c("sub_metering_1","sub_metering_2","sub_metering_3"),
       lty = 1,bty = "n",cex = 0.5)

plot(powerdata$DateTime, powerdata$Global_reactive_power, type = "l", 
     ylab="Global_rective_power", xlab = "datetime")

dev.copy(png,"plot4.png", width=480, height=480)
dev.off()
