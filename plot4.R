install.packages("reshape2")
library(reshape2)
install.packages("lattice")
library(lattice)
install.packages("chron")
library(chron)


#Create project file in working directory 
if (!file.exists("./project1_week1")){dir.create("./project1_week1")}

#Download data and unzip
fileUrl<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl,destfile ="./project1_week1/data.zip",method="curl" )
unzip("./project1_week1/data.zip",exdir="./project1_week1")

#Read Data
data<-read.table("./project1_week1/household_power_consumption.txt",sep=";",header=TRUE,stringsAsFactors = FALSE, dec=".")

#Subset data
data_to_use<-subset(data,Date %in% c("1/2/2007","2/2/2007"))

#graph 4
par(mfrow=c(2,2))

#1
with(data_to_use,plot(Global_active_power,type="l",xlim=c(0,2880),xaxt="n",xlab="",ylab="Global Active Power (kilowatts)"))
axis(1, at=c(0,1442,2880), labels=c("Thu","Fri","Sat"))

#2
with(data_to_use,plot(Voltage,type="l",xlim=c(0,2880),xaxt="n",xlab="datetime",ylab="Voltage"))
axis(1, at=c(0,1442,2880), labels=c("Thu","Fri","Sat"))


#3
with(data_to_use,plot(Sub_metering_1,type="l",xlim=c(0,2880),xaxt="n",xlab="",ylab="Energy sub metering"))
with(data_to_use,lines(Sub_metering_2,type="l",xlim=c(0,2880),xaxt="n",xlab="",ylab="Energy sub metering",col="red"))
with(data_to_use,lines(Sub_metering_3,type="l",xlim=c(0,2880),xaxt="n",xlab="",ylab="Energy sub metering",col="blue"))
axis(1, at=c(0,1442,2880), labels=c("Thu","Fri","Sat"))
legend(1100,45,legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,bty="n", lwd=2.5, col=c("black", "red", "blue"))

#4
with(data_to_use,plot(Global_reactive_power,type="l",xlim=c(0,2880),xaxt="n",xlab="datetime",ylab="Global _reactive_power"))
axis(1, at=c(0,1442,2880), labels=c("Thu","Fri","Sat"))




dev.copy(png,'./project1_week1/plot4.png')
dev.off()



