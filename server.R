#nbp server.R

#subset and visualize
shinyServer(function(input,output,session){
  plot.data <- reactive({
    getMonthlySpeciesData(species=input$species,parks=input$park)
  })
  
  output$table <- renderTable({
    plot.data() %>% arrange(Site,Species,Month)
  })
  
  output$plot1 <- renderPlot({
    if(input$linetype==T){
    plotSpeciesMonths_smooth(plot.data())
    } else {
      plotSpeciesMonths_line(plot.data())
    }
  })
  
  output$plot.download <- downloadHandler(
    filename="plot.pdf",
    content=function(file) {
      if(input$linetype==T){
        pdf(file,width=8,height=4)
        a <- plotSpeciesMonths_smooth(plot.data())
        print(a)
        dev.off()
      } else {
        pdf(file,width=8,height=4)
        a <- plotSpeciesMonths_line(plot.data())
        print(a)
        dev.off()
      }
    },
    contentType = "pdf"
    )
  
})
