##Read data from file
pdata <- read.table("/Users/spoorthy/Downloads/household_power_consumption.txt", sep = ";")

## rename columns
names(pdata) = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1","Sub_metering_2", "Sub_metering_3" )

###get rid of first row
pdata <- pdata[-1,]

###setting the date values right
time_var <- strptime(pdata[,1], "%d/%m/%Y")
pdata$Date <- time_var

##selecting data needed only for 2007-02-01 and 2007-02-02