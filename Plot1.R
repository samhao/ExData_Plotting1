

## graph 1
## ---------------



png(filename='figure/plot1.png', width=480, height=480 )

hist(hpcdt$Global_active_power, breaks=seq(0, 8, 0.5),
        xaxt = 'n',
        xlab = 'Global Active Power (kilowatts)',
        ylab = 'Frequency', 
        main='Global Active Power', 
        col=c('red')                 
     )

axis (1, at=c(0, 2, 4, 6))

dev.off()

