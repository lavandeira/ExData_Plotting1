
## Read data
        archivo <- archivo <- "C:/Users/Josué Lavandeira/Desktop/Coursera/DSS/Coursera R/HHC.txt"
## Create table named x that stores data
        x <- read.table(archivo, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
## Subset data from dates 1/2/2007 & 2/2/2007
        subsetx <- x[x$Date %in% c("1/2/2007","2/2/2007") ,]
## Store the Global Active Power variable as numbers in a new variable
        GAP <- as.numeric(subsetx$Global_active_power)
## Open png device and set width and height
        png("plot1.png", width=480, height=480)
## Plot a histogram setting the color to red, the title and label for x axis
        hist(GAP, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
## Close device
        dev.off()