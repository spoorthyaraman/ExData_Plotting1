###This file contains the code to generate plot1 per the exercise###

###Step 1: Reading the Data 

#Assume the file is in the work directory
all_data <- read.table("household_power_consumption.txt", sep = ";")

#Rename the headers of the file
names(all_data) = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1","Sub_metering_2", "Sub_metering_3" )

#Delete first row since it contains the column names
all_data <- all_data[-1,]

#Cleaning up the date values to convert them into standard formats
time_var <- strptime(all_data[,1], "%d/%m/%Y")
all_data$Date <- time_var
time_var <- as.Date(time_var)

#Selecting data needed only for 2007-02-01 and 2007-02-02
cdata <- subset(pdata, Date == as.Date("2007-02-01") | Date == as.Date("2007-02-02"))

################################################

###Step 2: Plotting the histogram

#Open the PNG file device
png("plot1.png")

#Call the histogram function
hist(as.numeric(as.character(cdata$Global_active_power)), col="red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")

#Switch the device off
dev.off()
