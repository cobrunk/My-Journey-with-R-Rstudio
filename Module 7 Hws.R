#install.packages('RMySQL')
library(RMySQL)
library(ggplot2)

#install.packages('RJSONIO', dependencies = t)
library('RJSONIO')

#7.1
m_data=fromJSON(file.choose())
m_data

m_data$students[[1]]$Info$state="MO"
m_data$students[[1]]$Info$state
m_data$students[[2]]$Info$state="MO"
m_data$students[[2]]$Info$state



# 7.2
connection1 = dbConnect(RMySQL::MySQL(),
                        user='admin',password='dataprogramming',
                        db_name='db',
                        host= "dataprogrammingdb.coqa5chqqklu.us-east-1.rds.amazonaws.com")


rs= dbSendQuery(connection1, 'create database Caleb_Brunk')

rs = dbSendQuery(connection1, 'show databases')
databases=fetch(rs, n=-1)
databases

rs=dbSendQuery(connection1, 'use Caleb_Brunk')

mpg_df=data.frame(mpg)
dbWriteTable(connection1,value=mpg_df,name='mpg')

rs = dbSendQuery(connection1, 'show tables')
tables=fetch(rs, n=-1)
tables
# can also use dbListTables(connection1)

#rows
rs <- dbSendQuery(connection1, "select * from Caleb_Brunk.mpg where manufacturer='dodge'")
dodge_data <- fetch(rs, n=-1)
head(dodge_data)
dim(dodge_data)


# select columns
rs <- dbSendQuery(connection1, "select manufacturer, model, displ, year, cyl, trans from Caleb_Brunk.mpg")
col_data <- fetch(rs, n=-1)
head(col_data)
dim(col_data)

