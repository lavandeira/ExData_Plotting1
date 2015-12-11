
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
## Get Global Reactive Power from data and store it in a new subset
        GRP <- as.numeric(subsetx$Global_reactive_power)
## Get Voltage and store it in a new subset
        voltage <- as.numeric(subsetx$Voltage) 
## Subset submeterings from given dates and store them as numeric values in variables
        submetering1 <- as.numeric(subsetx$Sub_metering_1)
        submetering2 <- as.numeric(subsetx$Sub_metering_2)
        submetering3 <- as.numeric(subsetx$Sub_metering_3)
## Create png device and set width and height
        png("plot4.png", width=480, height=480)
## Set the number of plots in the device as 2x2
        par(mfrow = c(2, 2))
## Plot the Global Active Power vs date and time at the top left
        plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)
## Plot the voltage vs date and time at the top right
        plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")
## Plot energy submeterings at the bottom left changing line colors and setting the legends
        plot(datetime, submetering1, type="l", ylab="Energy Submetering", xlab="")
        lines(datetime, submetering2, type="l", col="red")
        lines(datetime, submetering3, type="l", col="blue")
        legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
## Plot Global Reactive Power vs date and time at the bottom right
        plot(datetime, globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")
## Close png device
        dev.off()