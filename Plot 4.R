#Plot 4

UCIlink <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
dwnld <- download.file(UCIlink, "household_power_consumption.txt")
UCIdata <- read.table( "household_power_consumption.txt", header=TRUE, sep = ";", stringsAsFactors=FALSE, dec=".")
#Filtering
UCIdata$Date2 <- as.Date(UCIdata$Date, "%d/%m/%Y")
UCI1 <-subset(UCIdata, UCIdata$Date2 > "2007-01-31" & UCIdata$Date2 < "2007-02-03")
#Variable Data Type Conversion
UCI1$Global_active_power <- as.numeric(UCI1$Global_active_power)
Sub_metering_1 <- as.numeric(UCI1$Sub_metering_1)
Sub_metering_2 <- as.numeric(UCI1$Sub_metering_2)
Sub_metering_3 <- as.numeric(UCI1$Sub_metering_3)
voltage <- as.numeric(UCI1$Voltage)
reactivepower <- as.numeric(UCI1$Global_reactive_power)
globalActivePower <- as.numeric(UCI1$Global_active_power)
#Plot
png("plot4.png", width=480, height=480)
par(mfrow=c(2,2))
plot(datetime, globalActivePower, type="l", xlab="datetime", ylab="Global Active Power")
plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")
plot(datetime, Sub_metering_1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, Sub_metering_2, type="l", col="red")
lines(datetime, Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")
plot(datetime, reactivepower, type="l", xlab="datetime", ylab="Global_reactive_power")
#Create PNG
dev.copy(png,file="plot3.png")
dev.off()