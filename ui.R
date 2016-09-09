#nbp ui.R

shinyUI(fluidPage(
  titlePanel("NBP Monthly Abundance Index"),
  sidebarLayout(
    sidebarPanel(
      selectInput("species","Species:",levels(factor(df$Species)),multiple=T),
      selectInput("park","Park:",levels(factor(df$Site)),multiple=T)
    ),
    mainPanel(
      plotOutput("plot1")
    )
  )
))