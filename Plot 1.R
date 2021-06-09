setwd("C:/Users/Rafael/Downloads")
Sys.setlocale("LC_ALL","English")
electric_consumption <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
library(lubridate)
library(tidyverse)
library(lattice)
library(ggplot2)
lapply(electric_consumption, class)
filter_data <- subset(electric_consumption, Date %in% c("1/2/2007","2/2/2007"))
filter_data$Date <- as.Date(filter_data$Date, format="%d/%m/%Y")
filter_data <- mutate(filter_data, exact_time = ymd_hms(paste(as.character(filter_data$Date),filter_data$Time)))
par(mfrow = c(1,1))

#Plot 1

hist(filter_data$Global_active_power, col="red", main = "Global active power", xlab = "Global Active Power (Kilowatts)" )
dev.copy(png, file = "Plot1.png" )
dev.off()