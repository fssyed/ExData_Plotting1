UCIlink <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
dwnld <- download.file(UCIlink, "household_power_consumption.txt")
UCIdata <- read.table( "household_power_consumption.txt", header=TRUE, sep = ";", stringsAsFactors=FALSE, dec=".")
UCIdata$Date2 <- as.Date(UCIdata$Date, "%d/%m/%Y")
UCI1 <-subset(UCIdata, UCIdata$Date2 > "2007-01-31" & UCIdata$Date2 < "2007-02-03")
UCI1$Global_active_power <- as.numeric(UCI1$Global_active_power)

# Plot 3 = Energy Sub Metering by days

Sub_metering_1 <- as.numeric(UCI1$Sub_metering_1)
Sub_metering_2 <- as.numeric(UCI1$Sub_metering_2)
Sub_metering_3 <- as.numeric(UCI1$Sub_metering_3)

# Creating Days

datetime <- strptime(paste(UCI1$Date, UCI1$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

png("plot3.png", width=480, height=480)
plot(datetime, UCI1$Sub_metering_1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, UCI1$Sub_metering_2, type="l", col="red")
lines(datetime, UCI1$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.copy(png,file="plot3.png")
dev.off()
