install.packages("reshape2")
library(reshape2)

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

#graph 1
with(data_to_use,hist(as.numeric(Global_active_power),col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)",ylim=c(0,1200)))
dev.copy(png,'./project1_week1/plot1.png')
dev.off()





#graph 2


#graph 3


#graph 4


