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

##################################################################
###Convert Global Active Power Variable to Numeric for Plotting
##################################################################
energy_twodays$activepower <- as.numeric(energy_twodays$Global_active_power)

########################
##Paste Time with Date
########################
energy_twodays$date_time <- strptime(paste(energy_twodays$Date, energy_twodays$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

##################################################################
###Create Line Graph and Save as PNG File
##################################################################
plot(energy_twodays$date_time, energy_twodays$activepower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.copy(png, file = "plot2.png", width=480, height=480) 
dev.off() 