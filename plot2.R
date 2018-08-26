#########################################################################################################
##                                                PLOT 2                                               ##
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
plot(data1$Global_active_power~data1$Datetime, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")

# Save and create file
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()