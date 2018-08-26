###################################################################################################################
##                                                COURSE PROJECT 1                                               ##
###################################################################################################################

#########################################################################################################
##                                                PLOT 1                                               ##
#########################################################################################################
getwd()
list.files()
setwd("C:/Users/SETHEU/Documents/Coursera/04 EDA")

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
hist(data1$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

# Save and create file
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()