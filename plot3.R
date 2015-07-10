###This file contains the code to generate plot3 per the exercise###

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

#Obtaining the date and time for further calculation
#I have used the lubridate package - Please make sure its installed and loaded
date_time <- paste(cdata$Date, cdata$Time, sep = " ")
date_time <- ymd_hms(date_time)

#Adding that column to the original dataframe
cdata <- cbind(cdata,date_time)
################################################

###Step 2: Plotting the graph

#Open the PNG device
png("plot3.png")

#Call the plot function to initiate the plot
plot(cdata$date_time,as.numeric(as.character(cdata$Sub_metering_1)),type="s", xlab="", ylab="Energy sub metering")

#Call lines functiond to plot subsequent data
lines(cdata$date_time,as.numeric(as.character(cdata$Sub_metering_2)),type="s", col="red")
lines(cdata$date_time,as.numeric(as.character(cdata$Sub_metering_3)),type="s", col="blue")

#Provide the legend for the plot
legend("topright",legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),col=c("black","red","blue"),lty=1,lwd=1)

#Switch the device off
dev.off()