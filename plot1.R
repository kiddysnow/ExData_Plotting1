fileurl<-"http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileurl,destfile="./data/power.zip",method="curl")
power<-read.table("./data/power/household_power_consumption.txt",header=TRUE,sep=";")
mydate<-"%d/%m/%Y"
power$date<-as.character(power$Date)
power$Date<-as.Date(power$Date,mydate)
power1<-subset(power,power$Date=="2007-02-01"|power$Date=="2007-02-02")
power1$Global_active_power<-as.character(power1$Global_active_power)
power1$Global_active_power<-as.numeric(power1$Global_active_power)
hist(power1$Global_active_power,col="red",xlab="Global active power(kilowatts)",main="Global active power")
dev.copy(png,file="./data/power/plot1.png")
