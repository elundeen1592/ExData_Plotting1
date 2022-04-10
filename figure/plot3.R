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
par("mar")
plot(energy_twodays$date_time, energy_twodays$subMet1, type="l", ylab="Energy sub metering", xlab="")
lines(energy_twodays$date_time, energy_twodays$subMet2, type="l", col="red")
lines(energy_twodays$date_time, energy_twodays$subMet3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"), cex=0.7, pt.cex = 1)
par(mar = c(4,5,4,5))
dev.copy(png, file = "plot3.png", width=480, height=480) 
dev.off() 