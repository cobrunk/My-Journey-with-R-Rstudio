#################################################################
#                                                               #
#           DON'T HIT RUN, run app individually                 #
#                                                               #
#################################################################
library(shiny)
library(ggplot2)
library(tidyverse)
library(gtrendsR)
library(lubridate)

#6.1

ui=fluidPage(
  checkboxInput("check_hist", "Display Histogram", FALSE),
  verbatimTextOutput("value"),
  plotOutput("histogramPlot")
)
server = function(input, output) {
  output$value = renderText({input$check_hist})
  output$histogramPlot=renderPlot({
    if (input$check_hist){
      ggplot(mpg,aes(x=cty, fill=fl))+
        geom_histogram()
    }
  })
}
shinyApp(ui, server)

#6.2
#remove(list = ls())
trend_1<-gtrends('Capcom')
trend_2=gtrends('Larian')

Capcom<-filter(trend_1$interest_over_time, keyword =="Capcom")
Capcom$date = as.Date(Capcom$date)

Larian= filter(trend_2$interest_over_time, keyword =="Larian")
Larian$date= as.Date(Larian$date)



ui <- fluidPage(
  dateRangeInput("daterange1", "Date range:",
                 start = Sys.Date() - 60,
                 end   = Sys.Date()),
  plotOutput("Trend_plot_1"),
  plotOutput("Trend_plot_2")
)

server <- function(input, output) {
  output$Trend_plot_1 <- renderPlot({
    data_Cap<-filter(Capcom,date>=as.Date(input$daterange1[1]) &
                     date<=as.Date(input$daterange1[2]))
    
    ggplot(data_Cap,
           aes(x=date,y=hits, color= keyword))+
      geom_point()+
      xlab("Date")+
      ylab("Hits")
  })
  output$Trend_plot_2 <- renderPlot({
    data_Lar<-filter(Larian,date>=as.Date(input$daterange1[1]) &
                       date<=as.Date(input$daterange1[2]))
    
    ggplot(data_Lar,
           aes(x=date,y=hits, color= keyword))+
      geom_point()+
      xlab("Date")+
      ylab("Hits")
  })
 
}
shinyApp(ui, server)

