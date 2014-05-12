
fn1 <- "data/getdata_data_ss06hid.csv"
housing_raw <<- read.csv(fn1, colClasses = "character")
maxvals <- max(as.numeric(housing_raw$VAL), na.rm=TRUE)
housing_val_length <- length(housing_raw$VAL[housing_raw$VAL=="24"])


library(xlsx)
fn2 <- "data/getdata_data_DATA.gov_NGAP.xlsx"
# gov_raw <- read.xlsx(fn2, 1, colClasses = "character")

dat <- read.xlsx(fn2, 1, rowIndex=c(18:23), colIndex=c(7:15))
sum(dat$Zip*dat$Ext, na.rm=T)


library(XML)
# url<-"https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml"
fn3 <- "data/getdata_data_restaurants.xml"
xparse <- xmlParse(fn3)
xdat <- xmlToDataFrame(xparse)
str(xdat)

file <- download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2ss06pid.csv", "data/dl.csv", "curl", "wb")
fn4 <- "data/dl.csv"
DT <- fread(fn4)
