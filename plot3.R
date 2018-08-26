#########################################################################################################
##                                                PLOT 3                                               ##
#########################################################################################################

# Get Data
data <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?")

# Convert data
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

# Subset: Get dates 2007-02-01, 2007-02-02
data1 <- subset(data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

# Convert datetime
datetime <- paste(as.Date(data1$Date), data1$Time)
data1$Datetime <- as.POSIXct(datetime)

# Create plot
with(data1, {
  plot(Sub_metering_1~Datetime, type="l",
       ylab="Energy sub metering", xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# Save and create file
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()