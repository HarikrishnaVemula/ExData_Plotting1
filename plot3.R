setwd("C:\\Users\\Hari krishna\\Desktop\\ExData_Plotting1")



electic_power_data <- read.table("./exdata_data_household_power_consumption/household_power_consumption.txt", stringsAsFactors = FALSE, header = TRUE, sep =";"  )

MergeDateTime <- strptime(paste(electic_power_data$Date, electic_power_data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
electic_power_data <- cbind(electic_power_data, MergeDateTime)

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

png("plot3.png", width=480, height=480)
with(subset_electic_power_data, plot(MergeDateTime, Sub_metering_1, type="l", xlab="Day", ylab="Energy sub metering"))
lines(subset_electic_power_data$MergeDateTime, subset_electic_power_data$Sub_metering_2,type="l", col= "red")
lines(subset_electic_power_data$MergeDateTime, subset_electic_power_data$Sub_metering_3,type="l", col= "blue")
legend(c("topright"), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty= 1, lwd=2, col = c("black", "red", "blue"))

dev.off()