## this file contains all the codes for the project. the other four files have the part of codes necessary
## to generate each of the four plots.


## setting up:
## ----------------------------
rm(list=ls())
saveToFile = T

library(data.table)

url = 'https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip'
zipfile = 'hpc.zip'
csvfile = 'household_power_consumption.txt'
rdatafile = 'hpc.rdata'

if (!file.exists(zipfile)) {
    download.file(url=url,  destfile=zipfile)    
} 
    

if (!file.exists(csvfile)) {    
   unzip(zipfile=zipfile)
}


if (!file.exists(rdatafile)) {  
    hpcdt <- fread(input=csvfile, sep=';', header=T, verbose=F, nrows = -1)
    
    hpcdt <- hpcdt[Date %in% (c('1/2/2007', '2/2/2007')),]
    
    save(hpcdt, file=rdatafile)
    
}

if (!exists('hpcdt'))
    load(rdatafile)

## transformation of data:
## ---------------------------------
    
str(hpcdt)

starttime = as.numeric(as.POSIXct(strptime('1/2/2007 00:00:00', '%d/%m/%Y %H:%M:%S') ))


hpcdt$Datetime <- as.numeric(as.POSIXct(strptime(paste(hpcdt$Date, hpcdt$Time), '%d/%m/%Y %H:%M:%S'))) - starttime

hpcdt$Datetime = hpcdt$Datetime / (24*3600)

hpcdt[, Global_active_power := as.numeric(Global_active_power)]
hpcdt[, Global_reactive_power := as.numeric(Global_reactive_power)]      
hpcdt[, Voltage := as.numeric(Voltage)]      
hpcdt[, Global_intensity := as.numeric(Global_intensity)]      
hpcdt[, Sub_metering_1 := as.numeric(Sub_metering_1)]      
hpcdt[, Sub_metering_2 := as.numeric(Sub_metering_2)]      
hpcdt[, Sub_metering_3 := as.numeric(Sub_metering_3)]  

sum(is.na(hpcdt))
str(hpcdt)
summary(hpcdt)



## graph 1
## ---------------



if (saveToFile) png(filename='figure/plot1.png', width=480, height=480 )

hist(hpcdt$Global_active_power, breaks=seq(0, 8, 0.5),
        xaxt = 'n',
        xlab = 'Global Active Power (kilowatts)',
        ylab = 'Frequency', 
        main='Global Active Power', 
        col=c('red')                 
     )

axis (1, at=c(0, 2, 4, 6))

if (saveToFile) dev.off()


## graph 2
## ---------------

if (saveToFile) png(filename='figure/plot2.png', width=480, height=480 )

with(hpcdt, plot(Datetime, Global_active_power, xaxt = 'n', 
   type = 'l',
   xlab = '',
   ylab = 'Global Active Power (kilowatts)'       
   ))       
axis(1, at = c(0, 1, 2), labels = c('Thu', 'Fri', 'Sat'))              
 
if (saveToFile) dev.off()


## graph 3
## ---------------


if (saveToFile) png(filename='figure/plot3.png', width=480, height=480 )

with (hpcdt, {
                plot(Datetime, Sub_metering_1, type = 'l', 
                     xaxt = 'n',  xlab = '',
                     ylab = 'Energy sub metering (kilowatts)', col = c('black'))
                  
                lines(x = Datetime, y = Sub_metering_2, col = c('red'))
                  
                lines(x = Datetime, y = Sub_metering_3, col = c('blue'))
                
                axis(1, at = c(0, 1, 2), labels = c('Thu', 'Fri', 'Sat'))
                
                legend('topright', legend=c('Sub_metering_1', 'Sub_metering_2', 
                                            'Sub_metering_3'), 
                col= c('black', 'red', 'blue'), lty = 1 )      
            }  
)

if (saveToFile) dev.off()


## graph 4
## ---------------


if (saveToFile) png(filename='figure/plot4.png', width=480, height=480 )

par(mfrow = c(2, 2) )

with(hpcdt, plot(Datetime, Global_active_power, xaxt = 'n', 
   type = 'l',
   xlab = '',
   ylab = 'Global Active Power (kilowatts)'       
   ))       
axis(1, at = c(0, 1, 2), labels = c('Thu', 'Fri', 'Sat')) 

with(hpcdt, plot(Datetime, Voltage, xaxt = 'n', 
   type = 'l',
   xlab = 'datetime',
   ylab = 'Voltage'       
   ))       
axis(1, at = c(0, 1, 2), labels = c('Thu', 'Fri', 'Sat')) 


with (hpcdt, 
    {plot(Datetime, Sub_metering_1, type = 'l', 
         xaxt = 'n',  xlab = '',
         ylab = 'Energy sub metering (kilowatts)', col = c('black'))
      
    lines(x = Datetime, y = Sub_metering_2, col = c('red'))
      
    lines(x = Datetime, y = Sub_metering_3, col = c('blue'))
    
    axis(1, at = c(0, 1, 2), labels = c('Thu', 'Fri', 'Sat'))
    
    legend('topright', bty = 'n',
           legend=c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), 
           col= c('black', 'red', 'blue'), lty = 1 )      
    }  
)

with(hpcdt, plot(Datetime, Global_reactive_power, xaxt = 'n', 
   type = 'l',
   xlab = 'datetime',
   ylab = 'Global_reactive_power'       
   ))       
axis(1, at = c(0, 1, 2), labels = c('Thu', 'Fri', 'Sat')) 


if (saveToFile) dev.off()

par(mfrow = c(1, 1) )



