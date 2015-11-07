powerdata_all<- read.table("household_power_consumption.txt", header = TRUE, sep = ";",na.strings=c("?","NA"," ","#DIV/0!"))
powerdata_all$Date<-as.Date(powerdata_all$Date,"%d/%m/%Y")
powerdata<-powerdata_all[powerdata_all$Date>=as.Date("2007-02-01") & powerdata_all$Date<=as.Date("2007-02-2"),]
powerdata$DateTime<-strptime(paste(powerdata$Date,powerdata$Time),"%Y-%m-%d %H:%M:%S")


par(mfrow=c(1,1))
plot(powerdata$DateTime, powerdata$Global_active_power, type = "l", 
     ylab="Global Active Power (Kilowatts)",xlab = "")
dev.copy(png,"plot2.png", width=480, height=480)
dev.off()


