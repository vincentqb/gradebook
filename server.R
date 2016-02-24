library(shiny)
library(ggplot2)

# Define a server for the Shiny app
shinyServer(function(input, output) {

  data <- read.csv("course.csv")
  data$X <- NULL
  
  # Filter data based on selections
  output$table <- # Display the resulting table
    DT::renderDataTable(DT::datatable({
      
      # Spread table for display
      data <- data %>% 
        unite("Type", Type, TypeNumber, sep = " ") %>% 
        spread(Type, Score)
      
      # Correct column names
      names(data)[2] <- "Course"
      names(data)[3] <- "Final"
      # Reorder columns
      data <- data[c(1:3, 16:19, 4, 8:15, 5:7)]
      
      if (input$ID != "All") {
        data <- data[data$ID == input$ID,]
      }
      data
    }, rownames = FALSE))

  output$distPlot <- renderPlot({
    x    <- na.omit(data[data$Type == input$TypeHist, "Score"])
    
    num_bins = input$bins
    bins <- seq(min(x), max(x), length.out = num_bins + 1)
    
    # draw the histogram with the specified number of bins
    qplot(x, breaks = bins, col=I("white"))
  })
  
})
