


png(filename='figure/plot3.png', width=480, height=480 )

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

dev.off()
