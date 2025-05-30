library(tidyverse)
library(shiny)


# This is basically the example from the tutorial,
# "How to start with Shiny," by Garrett Grolemund.
ui <- fluidPage(
  # Application title
  titlePanel("Histogram of Sample from Normal Distribution"),
  
  # *Input() function
  sliderInput(inputId = "size",
              label = "Choose the sample size.",
              value = 25, min = 1, max = 100),
  
  # *Output() functions
  plotOutput("histogram")
)
server <- function(input,output) {
  output$histogram <- renderPlot({
    hist(rnorm(input$size))
  })
}
shinyApp(ui = ui, server = server)