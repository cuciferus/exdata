#reading file
df<-read.csv2("household_power_consumption.txt", sep=";", header=T)
#formating and subseting data
df$Date<-as.Date(df$Date, format="%d/%m/%Y")
df2<-subset(df, Date==as.Date("01/02/2007", format="%d/%m/%Y")| Date==as.Date("02/02/2007", format="%d/%m/%Y"))
df2$DateTime<-as.POSIXct(paste(df2$Date, df2$Time))
#clensing data
df2$Global_active_power<-as.numeric(gsub("\\?",NA, df2$Global_active_power))
df2$Global_reactive_power<-as.numeric(gsub("\\?",NA, df2$Global_reactive_power))
df2$Voltage<-as.numeric(gsub("\\?",NA, df2$Voltage))



#functions for code reuse
plot1function <-function(){
    hist(df2$Global_active_power, main="Global active power", col="red", xlab="Global Active Power (kilowatts)")
}
plot2function <-function(){
    plot(df2$DateTime,  df2$Global_active_power, ylab="Global Active Power (kilowatts)", type="l", lwd=1, xlab="")
}
plot3function <-function(){
    plot(df2$DateTime, df2$Sub_metering_1, type="l", ylab="Energy sub metering", xlab="")
    lines(df2$DateTime, df2$Sub_metering_2, type="l", col="red")
    lines(df2$DateTime, df2$Sub_metering_3, type="l", col="blue")
    legend("topright",  c(colnames(df2)[7:9]), col=c("black", "red", "blue"), lty=1, bty="n")

}
plot4function <- function(){
    plot(df2$DateTime, df2$Voltage, type="l", xlab="datetime", ylab="Voltage")
}
plot5function <- function(){
    plot(df2$DateTime, df2$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")
}



