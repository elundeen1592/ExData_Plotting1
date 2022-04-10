setwd("C:/Users/yxj4/OneDrive - CDC/+My_Documents/CDC/1 DDT/Data Modernization/Coursera/Hopkins Data Science Specialization/4 Exploratory Data Analysis/Course Project 1")

####################################
###Read in Data
####################################
energy <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".")
head(energy,10)
str(energy)

####################################
###Limit to 2 Days
####################################
energy_twodays <- energy[energy$Date %in% c("1/2/2007","2/2/2007") ,]

##################################################
###Convert Variables to Numeric for Plotting
##################################################
energy_twodays$activepower <- as.numeric(energy_twodays$Global_active_power)
energy_twodays$reactivepower <- as.numeric(energy_twodays$Global_reactive_power)
energy_twodays$voltage <- as.numeric(energy_twodays$Voltage)
energy_twodays$subMet1 <- as.numeric(energy_twodays$Sub_metering_1)
energy_twodays$subMet2 <- as.numeric(energy_twodays$Sub_metering_2)
energy_twodays$subMet3 <- as.numeric(energy_twodays$Sub_metering_3)

########################
##Paste Time with Date
########################
energy_twodays$date_time <- strptime(paste(energy_twodays$Date, energy_twodays$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

##################################################################
###Create Line Graph and Save as PNG File
##################################################################
par(mfrow = c(2,2))

plot(energy_twodays$date_time, energy_twodays$activepower, type="l", xlab="", ylab="Global Active Power")

plot(energy_twodays$date_time, energy_twodays$voltage, type="l", xlab="datetime", ylab="Voltage")

plot(energy_twodays$date_time, energy_twodays$subMet1, type="l", ylab="Energy sub metering", xlab="")
lines(energy_twodays$date_time, energy_twodays$subMet2, type="l", col="red")
lines(energy_twodays$date_time, energy_twodays$subMet3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty = "n", cex=0.7, pt.cex = 1)

plot(energy_twodays$date_time, energy_twodays$reactivepower, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.copy(png, file = "plot4.png", width=480, height=480) 
dev.off() 