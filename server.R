library(shiny)

# Define a server for the Shiny app
shinyServer(function(input, output) {
  
  # Filter data based on selections
  output$table <- DT::renderDataTable(DT::datatable({
    data <- read.csv("course.csv")
    data$X <- NULL
    if (input$ID != "All") {
      data <- data[data$ID == input$ID,]
    }
    if (input$Type != "All") {
      data <- data[data$Type == input$Type,]
    }
    data
  }, rownames= FALSE))
  
})