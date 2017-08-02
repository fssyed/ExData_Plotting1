UCIlink <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
dwnld <- download.file(UCIlink, "household_power_consumption.txt")
UCIdata <- read.table( "household_power_consumption.txt", header=TRUE, sep = ";", stringsAsFactors=FALSE, dec=".")
UCIdata$Date2 <- as.Date(UCIdata$Date, "%d/%m/%Y")
UCI1 <-subset(UCIdata, UCIdata$Date2 > "2007-01-31" & UCIdata$Date2 < "2007-02-03")
UCI1$Global_active_power <- as.numeric(UCI1$Global_active_power)

#Plot 2 - Global Active Power Frequency & Date & time

datetime <- strptime(paste(UCI1$Date, UCI1$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(UCI1$Global_active_power)
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
png("plot2.png", width=480, height=480)
dev.copy(png,file="plot2.png")
dev.off()