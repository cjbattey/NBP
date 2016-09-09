#nbp server.R
library(plyr);library(dplyr);library(magrittr);library(ggplot2);library(data.table)

#subset and visualize
shinyServer(function(input,output,session){
  plot.data <- reactive({
    getMonthlySpeciesData(species=input$species,parks=input$park)
  })
  output$plot1 <- renderPlot({
    plotSpeciesMonths(plot.data())
  })
})