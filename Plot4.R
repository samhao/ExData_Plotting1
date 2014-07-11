
## graph 4
## ---------------


png(filename='figure/plot4.png', width=480, height=480 )

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


dev.off()

par(mfrow = c(1, 1) )


