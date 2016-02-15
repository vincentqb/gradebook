library(shiny)

# Load data
data <- read.csv("course.csv")
data$X <- NULL

# Define the overall UI
shinyUI(
  fluidPage(
    titlePanel("Gradebook"),
    
    # Create a new Row in the UI for selectInputs
    fluidRow(
      column(2,
             selectInput("ID",
                         "ID:",
                         c("All",
                           unique(as.character(data$ID))))
      ),
      column(2,
             selectInput("Type",
                         "Type:",
                         c("All",
                           unique(as.character(data$Type))))
      )
    ),
    
    # Create a new row for the table.
    fluidRow(
      DT::dataTableOutput("table")
    )
  )
)