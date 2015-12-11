
## Read data
        archivo <- archivo <- "C:/Users/Josué Lavandeira/Desktop/Coursera/DSS/Coursera R/HHC.txt"
## Create table named x that stores data
        x <- read.table(archivo, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
## Subset data from dates 1/2/2007 & 2/2/2007
        subsetx <- x[x$Date %in% c("1/2/2007","2/2/2007") ,]
## Get date and time from current data and store it in a new subset
        datetime <- strptime(paste(subsetx$Date, subsetx$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
## Get Global Active Power from data and store it in a new subset
        GAP <- as.numeric(subsetx$Global_active_power)
## Subset submeterings from given dates and store them as numeric values in variables
        submetering1 <- as.numeric(subsetx$Sub_metering_1)
        submetering2 <- as.numeric(subsetx$Sub_metering_2)
        submetering3 <- as.numeric(subsetx$Sub_metering_3)
## Create png device and set width and height
        png("plot3.png", width=480, height=480)
## Plot energy submeterings changing line colors for 2nd and 3rd submeterings
        plot(datetime, submetering1, type="l", ylab="Energy Submetering", xlab="")
        lines(datetime, submetering2, type="l", col="red")
        lines(datetime, submetering3, type="l", col="blue")
## Set the legend for the plot at the top right corner with according line color samples
        legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
## Close png device
        dev.off()