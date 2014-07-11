
png(filename='figure/plot2.png', width=480, height=480 )

with(hpcdt, plot(Datetime, Global_active_power, xaxt = 'n', 
   type = 'l',
   xlab = '',
   ylab = 'Global Active Power (kilowatts)'       
   ))       
axis(1, at = c(0, 1, 2), labels = c('Thu', 'Fri', 'Sat'))              
 
dev.off()

