
## Read data
        archivo <- archivo <- "C:/Users/Josué Lavandeira/Desktop/Coursera/DSS/Coursera R/HHC.txt"
## Create table named x that stores data
        x <- read.table(archivo, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
## Subset data from dates 1/2/2007 & 2/2/2007
        subsetx <- x[x$Date %in% c("1/2/2007","2/2/2007") ,]
## Store the Global Active Power variable as numbers in a new variable
        GAP <- as.numeric(subsetx$Global_active_power)
## Get the date and time and store it in a new subset
        datetime <- strptime(paste(subsetx$Date, subsetx$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
## Open png device and set width and height
        png("plot2.png", width=480, height=480)
## Plot Global Active Power vs the date and time and set it to plot as a line
        plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
## Close device
        dev.off()
