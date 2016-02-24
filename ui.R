library(shiny)

# Load data
data <- read.csv("course.csv")
data$X <- NULL

# Define the overall UI
shinyUI(
  fluidPage(
    titlePanel("Interactive Gradebook"),
    
    fluidRow(column(2, selectInput("ID", "ID:", c("All", unique(as.character(data$ID)))))),
    
    # Create a new row for the table.
    fluidRow(
      DT::dataTableOutput("table")
    ),
    
    titlePanel("Grade Distribution"),

    fluidRow(
      column(2, selectInput("TypeHist", "Type:", 
                            c(unique(as.character(data$Type))), selected = "Course")),
      column(2, sliderInput("bins", "Number of bins:",
                            min = 5, max = 20, value = 10, ticks = FALSE)),
      plotOutput("distPlot")
    )
  )
)
