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

#graph 2
with(data_to_use,plot(Global_active_power,type="l",xlim=c(0,2880),xaxt="n",xlab="",ylab="Global Active Power (kilowatts)"))
axis(1, at=c(0,1442,2880), labels=c("Thu","Fri","Sat"))
dev.copy(png,'./project1_week1/plot2.png')
dev.off()



