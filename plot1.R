setwd("C:\\Users\\Hari krishna\\Desktop\\ExData_Plotting1")



electic_power_data <- read.table("./exdata_data_household_power_consumption/household_power_consumption.txt", stringsAsFactors = FALSE, header = TRUE, sep =";"  )


electic_power_data$Date <- as.Date(electic_power_data$Date, format="%d/%m/%Y")
electic_power_data$Time <- format(electic_power_data$Time, format="%H:%M:%S")
electic_power_data$Global_active_power <- as.numeric(electic_power_data$Global_active_power)
electic_power_data$Global_reactive_power <- as.numeric(electic_power_data$Global_reactive_power)
electic_power_data$Voltage <- as.numeric(electic_power_data$Voltage)
electic_power_data$Global_intensity <- as.numeric(electic_power_data$Global_intensity)
electic_power_data$Sub_metering_1 <- as.numeric(electic_power_data$Sub_metering_1)
electic_power_data$Sub_metering_2 <- as.numeric(electic_power_data$Sub_metering_2)
electic_power_data$Sub_metering_3 <- as.numeric(electic_power_data$Sub_metering_3)


subset_electic_power_data <- subset(electic_power_data, Date == "2007-02-01" | Date =="2007-02-02")

png("plot1.png", width=480, height=480)

hist(subset_electic_power_data$Global_active_power, col="red", border="black", main ="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency")



dev.off()




