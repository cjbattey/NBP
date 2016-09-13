#nbp ui.R

shinyUI(fluidPage(
  titlePanel("NBP Monthly Abundance Index"),
  sidebarLayout(
    sidebarPanel(
      selectInput("species","Species:",levels(factor(sp.months$Species)),multiple=T,
                  selected=c("Barn Swallow","Tree Swallow","Violet-green Swallow","Cliff Swallow",
                             "Northern Rough-winged Swallow")),
      selectInput("park","Park:",levels(factor(sp.months$Site)),multiple=T,
                  selected=c("Magnuson")),
      checkboxInput(inputId="linetype",label="Smooth Lines",value=T),
      downloadButton("plot.download",label="Download Plot")
    ),
    mainPanel(
      plotOutput("plot1"),
      tableOutput("table")
    )
  )
))