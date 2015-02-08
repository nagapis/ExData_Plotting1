

vars <- c("character", "character", rep("numeric", 7))
data.raw<-read.table("household_power_consumption.txt", h=1, sep=";", colClasses=vars, na.strings="?")
data.subset <- subset(data.raw, data.raw$Date =="1/2/2007" | data.raw$Date =="2/2/2007")

df <- as.data.frame(data.subset)
df$datetime <- paste(df$Date, df$Time)
df$datetime <- strptime(df$datetime, "%d/%m/%Y %H:%M:%S")

df$Date <- as.Date(df$Date, "%d/%m/%Y")
global_active_power<-df[,3]

par(mfrow=c(1,1))

plot(df[,10],df[,7], type="n", xlab="", ylab = "Energy sub metering")
lines(df[,10],df[,7])
lines(df[,10],df[,8], col="red")
lines(df[,10],df[,9], col="blue")
legend('topright',c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c('black', 'red', 'blue'), lty=1, cex=.75, pt.cex = 1)
