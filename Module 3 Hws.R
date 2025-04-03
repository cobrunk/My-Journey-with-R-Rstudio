data<-read.table("C:/Users/cobbl/Desktop/Data Programing - UMSL/GSPC.csv", header = TRUE, sep = ',')
DataF=read.csv(file="C:/Users/cobbl/Desktop/Data Programing - UMSL/GSPC.csv")
#End of M3.1Hw
#Start of M3.2 HW
A=array(dim=c(3,3))
A[1,1]=1;A[1,2]=2;A[1,3]=3;A[2,1]=4;A[2,2]=5;A[2,3]=6;A[3,1]=7;A[3,2]=8;A[3,3]=9;A

B=array(dim=c(3,3))
B[1,1]=1;B[1,2]=2;B[1,3]=3;B[2,1]=2;B[2,2]=1;B[2,3]=7;B[3,1]=7;B[3,2]=8;B[3,3]=9;B
C=A*B;C

install.packages('imager')
library('imager')
image=load.image("C:/Users/cobbl/Desktop/Data Programing - UMSL/header-gradbus51.jpg")
dim(image)
plot(image)


Toyota=gtrends("Toyota", time="2019-01-01 2019-12-31")

install.packages("quantmod")
library(quantmod)
# Download stock data
stock_data <- getSymbols("TM",
                         
                         from = "2019-01-01",
                         
                         to = "2019-12-31",
                         
                         periodicity = "weekly",
                         
                         auto.assign = FALSE)

head(stock_data)

write.csv(stock_data, "data.csv", row.names=FALSE)

plot(Toyota)
plot(stock_data$TM.Open)
