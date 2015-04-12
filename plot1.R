## read txt file

complete_data <- read.csv("C:/Users/User/Desktop/household_power_consumption.txt", header=T, sep=';', na.strings="?",nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')

## reformat date & subsetting date range
complete_data$Date <- as.Date(complete_data$Date, format="%d/%m/%Y")
data <- subset(complete_data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(complete_data)
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

## plotting histogram
hist(data$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

## saving file
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()