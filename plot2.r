

vars <- c("character", "character", rep("numeric", 7))
data.raw<-read.table("household_power_consumption.txt", h=1, sep=";", colClasses=vars, na.strings="?")
data.subset <- subset(data.raw, data.raw$Date =="1/2/2007" | data.raw$Date =="2/2/2007")

df <- as.data.frame(data.subset)
df$datetime <- paste(df$Date, df$Time)
df$datetime <- strptime(df$datetime, "%d/%m/%Y %H:%M:%S")

df$Date <- as.Date(df$Date, "%d/%m/%Y")
global_active_power<-df[,3]
##hist(global_active_power, breaks = 20, main="Global Active Power", col="red", xlab = "Global Active Power (kilowatts)")

plot(df[,10],df[,3], type = "n", ylab = "Global Active Power (kilowatts)", xlab="")
lines(df[,10],df[,3])
