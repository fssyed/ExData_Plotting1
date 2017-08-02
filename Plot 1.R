UCIlink <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
dwnld <- download.file(UCIlink, "household_power_consumption.txt")
UCIdata <- read.table( "household_power_consumption.txt", header=TRUE, sep = ";", stringsAsFactors=FALSE, dec=".")
UCIdata$Date2 <- as.Date(UCIdata$Date, "%d/%m/%Y")

#Plot 1 - Global Active Power Frequency

UCI1 <-subset(UCIdata, UCIdata$Date2 > "2007-01-31" & UCIdata$Date2 < "2007-02-03")
UCI1$Global_active_power <- as.numeric(UCI1$Global_active_power)
hist(UCI1$Global_active_power, col="red", xlab="Global Active Power (kilowatts)", main = "Global Active Power")
dev.copy(png, file="plot1.png")
dev.off()