powerdata_all<- read.table("household_power_consumption.txt", header = TRUE, sep = ";",na.strings=c("?","NA"," ","#DIV/0!"))
powerdata_all$Date<-as.Date(powerdata_all$Date,"%d/%m/%Y")
powerdata<-powerdata_all[powerdata_all$Date>=as.Date("2007-02-01") & powerdata_all$Date<=as.Date("2007-02-2"),]
powerdata$DateTime<-strptime(paste(powerdata$Date,powerdata$Time),"%Y-%m-%d %H:%M:%S")


par(mfrow=c(1,1))
plot(powerdata$DateTime, powerdata$Sub_metering_1, type = "l",
     ylab="Energy Sub Metering",xlab = "")
lines(powerdata$DateTime, powerdata$Sub_metering_2, type = "l",col="red")
lines(powerdata$DateTime, powerdata$Sub_metering_3, type = "l",col="blue")
legend("topright", col = c("black","blue", "red"), 
       legend = c("sub_metering_1 ","sub_metering_2 ","sub_metering_3 "),
       lty = 1,cex = 0.75)
dev.copy(png,"plot3.png", width=480, height=480)
dev.off()

